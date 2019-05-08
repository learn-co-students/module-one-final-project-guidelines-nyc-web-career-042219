require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require_relative '../lib/command_line_interface.rb'

welcome
user_name = get_user_name_from_user
user = User.find_or_create_by(name: user_name)

restaurant_name = get_restaurant_input
input = Restaurant.find_by(name: restaurant_name)
  if input == nil
    restaurant = populate_db_from_json(restaurant_name)
  else
    restaurant = input
  end

restaurant

restaurant_menu(user, restaurant)

puts "HELLO WORLD"


# welcome
# character = get_character_from_user
# show_character_movies(character)
