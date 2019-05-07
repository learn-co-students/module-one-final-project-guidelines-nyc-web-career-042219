require 'rest-client'
require 'json'
require 'pry'



def get_restaurant_violations(restaurant)
response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?accessType=DOWNLOAD')
  response_hash = JSON.parse(response_string)
  response_array = response_hash

  restaurant_inspection_array = response_hash["data"]
  #restaurant inspections
  #inspections_array = response_hash["data"]
  #array of all inspections

  restaurant_inspection_array.each do |restaurant_inspection|

    if restaurant_inspection[9]
      if restaurant.upcase! == restaurant_inspection[9]
          puts "#{restaurant_inspection[-4]}"
      end
    else
      "there is no restaurant by that name"
    end
    binding.pry
  end


 #response_hash["data"] = array of all inspections
 #response_hash["data"][9] = name of restaurant
  #response_hash["data"][-4] = letter grade
 #response_hash["data"][0][-3] = inspection datetime

end
