class GeocodeService
    require 'cgi'

    def self.call(address)
        base_url = "https://geocode.maps.co/search?q="
        request_url = base_url +
                      CGI.escapeURIComponent(address) +
                      "&api_key=#{Rails.application.credentials.geocode_api_key}"

        response = Faraday.get(request_url)
        data = JSON.parse(response.body).first
        data or raise IOError.new "Address not found."
        return {
            country_code: data['address']['country_code'],
            post_code: data['address']['postcode']
        }
    end
end