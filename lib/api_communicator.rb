require 'rest-client'
require 'json'
require 'pry'

def populate_db_from_json(restaurant)
  #get_restaurant_violations_from_JSON

  response_string = RestClient.get("https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?boro=MANHATTAN")
  response_hash = JSON.parse(response_string)

  #array of all restaurant inspections
  restaurant_inspections = response_hash["data"]

  selected_inspections = restaurant_inspections.select do |r|
    r[9] == restaurant.upcase
  end

  first_inspection = selected_inspections.first

  restaurant = Restaurant.new
  restaurant.name = first_inspection[9]
  restaurant.address = "#{first_inspection[11]} " + "#{first_inspection[12]}"
  restaurant.zipcode = first_inspection[13]
  restaurant.cuisine = first_inspection[15]
  restaurant.save

  violation = Violation.new
  violation.code = first_inspection[18]
  violation.description = first_inspection[19]
  violation.critical = first_inspection[20]
  violation.save

  inspection = Inspection.new
  inspection.grade = first_inspection[-4]
  inspection.date = first_inspection[-3]
  score_as_integer = first_inspection[21].to_i
  #return to datetime, parse datetime for profiles
  inspection.score = score_as_integer
  inspection.restaurant_id = restaurant.id
  inspection.violation_id = violation.id
  inspection.save



  restaurant

end
