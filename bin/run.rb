require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require_relative '../lib/command_line_interface.rb'

welcome
user_name = get_user_name_from_user
user = User.find_or_create_by(name: user_name)

restaurant_name = get_restaurant_input
find_in_db(restaurant_name)
  #return restaurant object
  if nil
    populate_db_from_json(restaurant_name)
    #return restaurant object
  end




puts "HELLO WORLD"


# welcome
# character = get_character_from_user
# show_character_movies(character)
