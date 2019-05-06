require 'rest-client'
require 'pry'

class Restaurant < ActiveRecord::Base

   has_many :dishes
   has_many :users, through: :dishes

  def self.get_rest_data
    # binding.pry
    response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_type=city&cuisines=mexican%2C%20chinese%2C%20pizza%2C%20sushi", {'user-key': "#{ENV['API_KEY']}", accept: :json})
    binding.pry
  end


end
