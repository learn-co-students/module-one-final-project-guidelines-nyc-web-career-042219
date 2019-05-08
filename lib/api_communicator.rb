require 'rest-client'
require 'json'
require 'pry'

def get_restaurant_violations(restaurant)
  response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?accessType=DOWNLOAD')
  response_hash = JSON.parse(response_string)
  restaurant_inspection_array = response_hash["data"]
  #array of all inspections

  manhattan_inspection_array = restaurant_inspection_array.select do |r|
    r[10] = "MANHATTAN"
  end

  # boro = "MANHATTAN"
  restaurant_inspection_array.each do |restaurant_inspection|
    if restaurant_inspection[9]
      if restaurant.upcase! == restaurant_inspection[9] # && restaurant_inspection[10] = boro
          puts "#{restaurant_inspection[-4]}"
      end
    else
      "there is no restaurant by that name"
    end
    binding.pry
  end

end
