require 'rest-client'
require 'json'
require 'pry'

def get_restaurant_violations(restaurant)

  response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?boro=MANHATTAN')
  response_hash = JSON.parse(response_string)

  #array of all restaurant inspections
  restaurant_inspections = response_hash["data"]

  selected_inspections = restaurant_inspections.select do |r|
    r[9] == restaurant.upcase
  end

  first_inspection = selected_inspections.first

  restaurant = Restaurant.new
  #refactor as find_or_create_by
  restaurant.name = first_inspection[9]
  restaurant.address = "#{first_inspection[11]} " + "#{first_inspection[12]}"
  #displaying as an array, join doesn't work though
  # restaurant_address.join(' ')
  restaurant.zipcode = first_inspection[13]
  restaurant.cuisine = first_inspection[15]
  restaurant.save

  inspection = Inspection.new
  #refactor as find_or_create_by
  inspection.grade = first_inspection[-4]
  inspection.date = first_inspection[-3]
  inspection.restaurant_id = restaurant.id
  inspection.save

  violation = Violation.new
  #refactor as find_or_create_by
  violation.code = first_inspection[18]
  violation.description = first_inspection[19]
    if first_inspection[20]
      violation.critical = true
    else
      violation.critical = false
    end
  violation.save
  binding.pry
  restaurant.profile

end
