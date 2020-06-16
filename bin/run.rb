require_relative '../config/environment'
#require_relative'../app/Compliment.rb'
require_relative '../app/command_line_interface'



command = ''
cli = CommandLineInterface.new
cli.runner 
