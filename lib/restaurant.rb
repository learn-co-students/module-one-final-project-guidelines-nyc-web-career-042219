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


  def self.search_by_cuisine(user)
    puts " "
    puts "Select desired cuisine"
    puts "1. Italian"
    puts "2. Asian"
    puts "3. Indian"
    puts "4. Cafe"
    puts "5. Mediterranean"
    puts "6. Return to main menu"

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
      main_menu
    else
      puts "please select 1, 2, 3, or 4 "
      main_menu(user)
    end



    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone&cuisines=#{cuisine}", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    string = response.body
    data = JSON.parse(string)

    puts " "
    puts "Search Results:"
    data['restaurants'].map do |rest|
      location = rest['restaurant']['location']['city']
      name = rest['restaurant']['name']
      puts "#{name}, location: #{location}"


    end
    main_menu(user)
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
