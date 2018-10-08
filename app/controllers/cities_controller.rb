class CitiesController < ApplicationController

  def view
      @city = params[:city]    
      if @city                                   #parameter city passed and city exists in hash
          @cityObject = City.all[@city.to_sym]
          if @cityObject 
              @cityName = @cityObject.name
              @cityPopulation = @cityObject.population
              @cityLandmark = @cityObject.landmark
          else 
              @message = 'no such a city'            #parameter city passed but it's not in hash 
              @allCities = City.all
          end
      else                                       #no parameter city passed 
          @allCities = City.all
      end
  end
  
  
  def new         
  end
  
  
  def create
      name = params[:city]      
      if name
            if not City.all.has_key?(name.to_sym)
                city = City.new(
                    name: params[:city],
                    population: params[:population],
                    landmark: params[:landmark]
                )
                city.save
            else
                @message = 'The city already exists, no changes will be made'
            end
     end
     redirect_to "/cities/view"
  end
  
  
  def callUpdateForm
      render "cities/update"
  end  
    
  
  def update
    cityToUpdate = params[:city]   
    citiesHash = City.all
    if citiesHash 
        cityObj = citiesHash[cityToUpdate.to_sym]                           #the city object to be updated is in the hash
        if cityObj != nil
            cityObj.update(population: params[:population], landmark: params[:landmark])        #then get that city object from hash and call update on it 
        else
            @message = "the city you want to update doesn't exist in the data base"   #if no such a city in the hash, show a message  
        end
    else
        @message = "the hash doesn't exists"        #no hash exists yet
    end    
    redirect_to "/cities/view"
  end
  
end
