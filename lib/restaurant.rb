require 'rest-client'
require 'pry'

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
    Restaurant.search_by_cuisine
    main_menu(user)
  end

  def self.cuisine_by_num(input) #returns the cuisine string after recieving cuisine ID
    case input
    when "55"
      cuisine = "Italian"
    when "3"
      cuisine = "Asian"
    when "7"
      cuisine = "Indain"
    when "30"
      cuisine = "Cafe"
    when "70"
      cuisine = "Mediterranean"
    when "1"
      cuisine = "American"
    when "136"
      cuisine = "Mexican"
    else
      cuisine = "Other"
    end
    cuisine
  end

  def self.search_by_cuisine
    puts " "
    puts "Select desired cuisine"
    puts "1. Italian"
    puts "2. Asian"
    puts "3. Indian"
    puts "4. Cafe"
    puts "5. Mediterranean"
    puts "6. American"
    puts "7. Mexican"
    puts "8. Return to main menu"

    input = gets.chomp

    case input
    when "1"
      cuisine = 55
    when "2"
      cuisine = 3
    when "3"
      cuisine = 7
    when "4"
      cuisine = 30
    when "5"
      cuisine = 70
    when "6"
      cuisine = 1
    when "7"
      cuisine = 136
    when "8"
      return
    else
      puts "please select 1-8 please "
      search_by_cuisine(user)
    end



    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone&cuisines=#{cuisine}", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    string = response.body
    data = JSON.parse(string)
    counter = 1
    puts " "
    puts "Search Results:"
    rest_data = data['restaurants'].map do |rest|
      location = rest['restaurant']['location']['city']
      name = rest['restaurant']['name']
      puts "#{counter}. #{name}, location: #{location}"
      counter += 1
      "#{name},#{location},#{cuisine}"
    end
    rest_data
  end


  def self.get_rest_info
    rest_data= Restaurant.search_by_cuisine
    puts " "
    puts "Select Restaurant (1-20)"
    #selects requested cuisine
    rest_num = gets.chomp
    rest_num=rest_num.to_i #turns input into integer
    #splits the rest info as it is given by "search_by_cuisine" to name, location, cuisine
    rest_info =rest_data[rest_num - 1].split(",")
    rest_name =  rest_info[0]
    rest_location= rest_info[1]
    rest_cuisine = Restaurant.cuisine_by_num(rest_info[2])
    #At this point I have all data I need to create or find the restaurant in the table database
    rest = Restaurant.find_or_create_by(name: rest_name, cuisine: rest_cuisine, location: rest_location)
    rest.id
  end
  # def self.rest_search_menu(user)
  #   puts " "
  #   puts "How would you like to search for a restaurant?"
  #   puts "1. Search for a restaurant by location"
  #   puts "2. Search for a restaurant by cuisine"
  #   puts "3. Return to main menu"
  #   puts "4. Exit"
  #
  #   input = gets.chomp
  #
  #     case input
  #     when "1"
  #       puts "selected 1"
  #     when "2"
  #
  #       Restaurant.search_by_cuisine(user)
  #       main_menu(user)
  #     when "3"
  #       main_menu(user)
  #     when "4"
  #       exit
  #     else
  #       puts "please select 1, 2, 3, or 4 "
  #       main_menu(user)
  #     end
  #
  #
  # end


end
