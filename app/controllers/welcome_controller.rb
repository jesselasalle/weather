class WelcomeController < ApplicationController
  require 'cgi'

  def index
    # debugger
    @default_address = "100 Alfred Lerner Way, Cleveland, Ohio"
    @current_address = params[:address] || @default_address

    @weather = lookup_weather(@current_address)
  end

  def lookup_weather(address)
    base_url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/"
    encoded_address = CGI.escapeURIComponent(address)
    request_url = base_url +
                  encoded_address +
                  "?unitGroup=us&include=days,current&key=" +
                  Rails.application.credentials[:weather_api_key] +
                  "&contentType=json"
    debugger
  end
end
