require_relative "../services/weather_service"

class MainController < ApplicationController
  
  def callForm
      render "main/index"
  end

  def index
    cityToCheck = params[:city]
    #@w = WeatherService.get(cityToCheck)
    
    if City.all[cityToCheck.to_sym] == nil              #no requested city exists in hash yet
        
        city = City.new(
                    name: params[:city],
                    population: params[:population],
                    landmark: params[:landmark]
                )
        city.save
               
    else
        if @w
            @temperature = (9 / 5) * (@w[:temperature] - 273) + 32
        end
        #city.find_by(name: cityToCheck)
    end
    
  def callView
      render 'cities/view'
  end
    
    #if @w
    #  @temperature = (9 / 5) * (@w[:temperature] - 273) + 32
    #  
    #  city = City.new(
	  #		    name: params[:city],
		#	    temperature: @temperature, # Using the converted temperature
		#	    description: @w[:description]
		#  )
      
		  # Save the city so that it's in City.all
		#  city.save
    #end
    
  end

end
