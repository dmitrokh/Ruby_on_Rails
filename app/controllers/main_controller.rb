require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # @name = params[:name]
    # Uncomment and pass a parameter to the get function
    @w = WeatherService.get(params[:city])
    if @w
      @temperature = (9 / 5) * (@w[:temperature] - 273) + 32
      
      city = City.new(
			    name: params[:city],
			    temperature: @temperature, # Using the converted temperature
			    description: @w[:description]
		  )
      
		  # Save the city so that it's in City.all
		  city.save
    end
    
  end

end
