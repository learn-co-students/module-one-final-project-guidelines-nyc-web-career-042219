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

    binding.pry
    data
  end


end
