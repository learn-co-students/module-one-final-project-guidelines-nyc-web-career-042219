require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require_relative '../lib/command_line_interface.rb'

welcome
user_name = get_user_name_from_user
user = User.find_or_create_by(name: user_name)
binding.pry


restaurant_name = get_restaurant_name
get_restaurant_violations(restaurant_name)

puts "HELLO WORLD"


# welcome
# character = get_character_from_user
# show_character_movies(character)
