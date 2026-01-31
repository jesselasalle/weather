class WelcomeController < ApplicationController
  def index
    # debugger
    @default_address = "100 Alfred Lerner Way, Cleveland, Ohio"
    @current_address = params[:address] || @default_address

    @weather = lookup_weather(@current_address)
  end

  private

  def lookup_weather(address)
    geocode = geocode_address(address)
    geocode_cache_key = "#{geocode[:country_code]}/#{geocode[:post_code]}"
    @weather = Rails.cache.fetch(geocode_cache_key, expires_in: 30.minutes) do
      WeatherService.call(geocode[:post_code])
    end
  end

  def geocode_address(address)
    GeocodeService.call(address)
  end
end
