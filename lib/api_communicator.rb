require 'rest-client'
require 'json'
require 'pry'

def get_user_name_from_user
  puts "please enter your name"
  user_name = gets.chomp
end

def get_restaurant_violations(restaurant)
response_string = RestClient.get('https://data.cityofnewyork.us/api/views/43nn-pn8j/rows.json?accessType=DOWNLOAD')
  response_hash = JSON.parse(response_string)
  response_array = response_hash
  binding.pry

end
