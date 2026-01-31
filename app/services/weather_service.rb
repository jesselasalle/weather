class WeatherService
    def self.call(address)
        base_url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/"
        encoded_address = CGI.escapeURIComponent(address)
        request_url = base_url +
                  encoded_address +
                  "?unitGroup=us&include=days,current&key=" +
                  Rails.application.credentials[:weather_api_key] +
                  "&contentType=json"

        response = Faraday.get(request_url)
        result = JSON.parse(response.body)
    end
end