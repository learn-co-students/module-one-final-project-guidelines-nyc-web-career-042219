require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'
require 'leslie_adjectives.rb'
require 'leslie_animals.rb'
require 'leslie_end_statements.rb'


class Compliment < ActiveRecord::Base
  has_many :user_compliments
  has_many :users, through: :user_compliments

  def self.get_chuck
    response_string = RestClient.get("https://api.chucknorris.io/jokes/random")
    response_hash = JSON.parse(response_string)
    chuck_joke = response_hash["value"]
  end

  def self.customize_chuck(name)
    jed = self.get_chuck.sub!("Chuck Norris", name)
    # binding.pry
  end

  def self.get_leslie(name)
    "Oh #{name}, you #{LeslieAdjective.adjective} #{LeslieAnimal.animal}, #{LeslieEnding.ending}"
  end

end

bah = Compliment.get_leslie("Jed")
