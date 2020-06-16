require 'rest-client'
require 'pry'
require 'colorize'
class Restaurant < ActiveRecord::Base

   has_many :dishes
   has_many :users, through: :dishes

  def self.data
    # binding.pry
    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    string = response.body
    data = JSON.parse(string)

    data
  end

  def self.find_rest_by_cuisine(user)
    Restaurant.search_by_cuisine(user)
    main_menu(user)
  end

  def self.send_cuisine_to_api(cuisine, cuisine_name)#gets data from API according to cuisine
    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone&cuisines=#{cuisine}", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    string = response.body
    data = JSON.parse(string)

    counter = 1#counter for listing the search results
    puts " "
    puts "Search Results:".bold.colorize(:green)
    #prints out search result AND saves info into array of restaurant name, location and cuisine
    rest_data = data['restaurants'].map do |rest|
      location = rest['restaurant']['location']['city']
      name = rest['restaurant']['name']
      puts "#{counter}.".colorize(:green)+" #{name}, location: #{location}"
      counter += 1
      "#{name},#{location},#{cuisine_name}"
    end
    puts ".*.".colorize(:light_black) * 44
    puts " "
    #if no search results were found, return to selecting a cuisine

    rest_data
  end

  def self.search_by_cuisine(user)

    puts ".*.".colorize(:light_black) * 44
    puts "Select desired cuisine".bold.colorize(:blue)
    puts "1. ".colorize(:light_blue)+"Italian"
    puts "2. ".colorize(:magenta)+"Asian"
    puts "3. ".colorize(:blue)+"Indian"
    puts "4. ".colorize(:cyan)+"Cafe"
    puts "5. ".colorize(:green)+"Mediterranean"
    puts "6. ".colorize(:light_green)+"American"
    puts "7. ".colorize(:yellow)+"Mexican"
    puts "8. ".colorize(:light_yellow)+"Return to main menu"
    puts ".*.".colorize(:light_black) * 44


    input = gets.chomp

    case input
    when "1"
      cuisine = 55
      cuisine_name = "Italian"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "2"
      cuisine = 3
      cuisine_name = "Asian"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "3"
      cuisine = 7
      cuisine_name = "Indian"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "4"
      cuisine = 30
      cuisine_name = "Cafe"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "5"
      cuisine = 70
      cuisine_name = "Mediterranean"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "6"
      cuisine = 1
      cuisine_name = "American"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "7"
      cuisine = 136
      cuisine_name = "Mexican"
      rest_data = self.send_cuisine_to_api(cuisine, cuisine_name)
    when "8"
      main_menu(user)
    else
      puts "Please select 1-8".bold
      rest_data = self.search_by_cuisine(user)
    end






    rest_data


  end


  def self.get_rest_info(user)
    rest_data= Restaurant.search_by_cuisine(user)
    # binding.pry
    if rest_data.length == 0
      puts "No restaurants of that cuisine have been found in your area"
      rest_data = self.search_by_cuisine(user)
    end
    puts " "
    puts "Select Restaurant (1-#{rest_data.length})".bold
    #selects requested cuisine

    rest_num = gets.chomp
    rest_num=rest_num.to_i #turns input into integer
    #splits the rest info as it is given by "search_by_cuisine" to name, location, cuisine
    rest_info =rest_data[rest_num - 1].split(",")

    #At this point I have all data I need to create or find the restaurant in the table database
    rest = Restaurant.find_or_create_by(name: rest_info[0], cuisine: rest_info[2], location: rest_info[1])
    rest.id

  end


end
