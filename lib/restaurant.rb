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
    Restaurant.search_by_cuisine(user)
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

  def self.search_by_cuisine(user)
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
      cuisine_name = "Italian"
    when "2"
      cuisine = 3
      cuisine_name = "Asian"
    when "3"
      cuisine = 7
      cuisine_name = "Indian"
    when "4"
      cuisine = 30
      cuisine_name = "Cafe"
    when "5"
      cuisine = 70
      cuisine_name = "Mediterranean"
    when "6"
      cuisine = 1
      cuisine_name = "American"
    when "7"
      cuisine = 136
      cuisine_name = "Mexican"
    when "8"
      main_menu(user)
    else
      puts "please select 1-8 please "
      self.search_by_cuisine(user)
    end


    #gets data from API according to cuisine
    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone&cuisines=#{cuisine}", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    string = response.body
    data = JSON.parse(string)

    counter = 1#counter for listing the search results
    puts " "
    puts "Search Results:"
    #prints out search result AND saves info into array of restaurant name, location and cuisine
    rest_data = data['restaurants'].map do |rest|
      location = rest['restaurant']['location']['city']
      name = rest['restaurant']['name']
      puts "#{counter}. #{name}, location: #{location}"
      counter += 1
      "#{name},#{location},#{cuisine_name}"
    end
    #if no search results were found, return to selecting a cuisine
    if rest_data.length == 0
      puts "No restaurants of that cuisine have been found in your area"
      self.search_by_cuisine(user)
    end
    rest_data

  end


  def self.get_rest_info(user)
    rest_data= Restaurant.search_by_cuisine(user)
    puts " "
    puts "Select Restaurant (1-20)"
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
