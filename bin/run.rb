require_relative '../config/environment'
require_relative '../lib/restaurant.rb'
require_relative '../lib/user.rb'
require_relative '../lib/dish.rb'
require_relative '../lib/cli.rb'
require 'colorize'
#binding.pry

welcome
user = get_user

main_menu(user)


Restaurant.data
