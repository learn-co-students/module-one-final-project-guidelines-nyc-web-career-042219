require 'rest-client'
require 'json'
require 'pry'

def get_restaurant_violations(restaurant)
  response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?accessType=DOWNLOAD')
  response_hash = JSON.parse(response_string)
  # response_array = response_hash

  restaurant_inspections = response_hash["data"]
  #array of all restaurant inspections

  restaurant_inspections.each do |restaurant_inspection|
    if restaurant_inspection[9] == restaurant
      restaurant_name = restaurant_inspection[9]
      restaurant_address = restaurant_inspection[11], restaurant_inspection[12]
      # restaurant_address.join(' ')
      restaurant_zipcode = restaurant_inspection[13]
      restaurant_cuisine = [15]
      inspection_rating = restaurant_inspection[-4]
      inspection_date = restaurant_inspection[-3]
      puts ""
      puts ""
      puts "#{restaurant_name}"
      puts ""
      puts "#{restaurant_address}, #{restaurant_zipcode}"
      puts ""
      puts "*" * 20
      puts ""
      puts "#{inspection_rating} - #{inspection_date}"
      puts ""
      puts "*" * 20
      puts ""
    end
    if restaurant_inspection[9]
      if restaurant.upcase! == restaurant_inspection[9] # && restaurant_inspection[10] = boro
          puts "#{restaurant_inspection[-4]}"
      end
    else
      "there is no restaurant by that name"
    end
    # binding.pry
  end

end
