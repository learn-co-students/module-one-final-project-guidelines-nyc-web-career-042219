require 'rest-client'
require 'json'
require 'pry'

def get_restaurant_violations(restaurant)

  response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?boro=MANHATTAN')
  response_hash = JSON.parse(response_string)

  #array of all restaurant inspections
  restaurant_inspections = response_hash["data"]

  restaurant_inspections.each do |restaurant_inspection|

    if restaurant_inspection[9] == restaurant
      restaurant = Restaurant.new
      #refactor as find_or_create_by
      restaurant.name = restaurant_inspection[9]
      restaurant.address = "#{restaurant_inspection[11]} " + "#{restaurant_inspection[12]}"
      #displaying as an array, join doesn't work though
      # restaurant_address.join(' ')
      restaurant.zipcode = restaurant_inspection[13]
      restaurant.cuisine = restaurant_inspection[15]
      restaurant.save
      inspection = Inspection.new
      #refactor as find_or_create_by
      inspection.grade = restaurant_inspection[-4]
      inspection.date = restaurant_inspection[-3]
      inspection.restaurant_id = restaurant.id
      inspection.save
      violation = Violation.new
      #refactor as find_or_create_by
      violation.code = restaurant_inspection[18]
      violation.description = restaurant_inspection[19]
        if restaurant_inspection[20]
          violation.critical = true
        else
          violation.critical = false
        end
      violation.save
      binding.pry
      restaurant.profile
      # puts ""
      # puts ""
      # puts "#{restaurant.name}"
      # puts ""
      # puts "#{restaurant.address}, #{restaurant.zipcode}"
      # puts ""
      # puts "*" * 20
      # puts ""
      # puts "#{inspection_rating} - #{inspection_date}"
      # puts ""
      # puts "*" * 20
      # puts ""
      # binding.pry
    end


#     if restaurant_inspection[9]
#       if restaurant_inspection[9] == restaurant.upcase
#         restaurant_name = restaurant_inspection[9]
#         restaurant_address = restaurant_inspection[11], restaurant_inspection[12]
#         # restaurant_address.join(' ')
#         restaurant_zipcode = restaurant_inspection[13]
#         restaurant_cuisine = [15]
#         inspection_rating = restaurant_inspection[-4]
#         inspection_date = restaurant_inspection[-3]
#         puts ""
#         puts ""
#         puts "#{restaurant_name}"
#         puts ""
#         puts "#{restaurant_address}, #{restaurant_zipcode}"
#         puts ""
#         puts "*" * 20
#         puts ""
#         puts "#{inspection_rating} - #{inspection_date}"
#         puts ""
#         puts "*" * 20
#         puts ""
#       end
#     end

    # if restaurant_inspection[9]
    #   if restaurant.upcase! == restaurant_inspection[9] # && restaurant_inspection[10] = boro
    #       puts "#{restaurant_inspection[-4]}"
    #   end
    # else
    #   "there is no restaurant by that name"
    # end
    # # binding.pry
  end
end
