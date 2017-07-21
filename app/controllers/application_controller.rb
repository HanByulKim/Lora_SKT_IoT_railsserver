class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :weather

  def weather
      url = 'http://apis.skplanetx.com/weather/current/minutely?version=1&lat=37.5714000000&lon=126.9658000000'
      #request =  {"data" => data}.to_json
      json = RestClient.get(url, :accept => :json, :appKey => ENV['SK_APP_KEY'])
      #'http://apis.skplanetx.com/weather/current/minutely?version=1&lat=37.5714000000&lon=126.9658000000'
      hash = JSON.parse(json)
      sky_stat = hash["weather"]["minutely"][0]["sky"]["name"]
      sky_code = hash["weather"]["minutely"][0]["sky"]["code"]
      temperature = hash["weather"]["minutely"][0]["temperature"]["tc"]

      weather_data = Array[]
      weather_data.push(sky_stat)
      weather_data.push(sky_code)
      weather_data.push(temperature)

      return weather_data
  end
  
end
