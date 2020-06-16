require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'
require_relative '../app/leslie_adjectives.rb'
require_relative '../app/leslie_animals.rb'
require_relative '../app/leslie_end_statements.rb'


class Compliment < ActiveRecord::Base
  has_many :user_compliments
  has_many :users, through: :user_compliments

  def self.get_chuck
    response_string = RestClient.get("https://api.chucknorris.io/jokes/random")
    response_hash = JSON.parse(response_string)
    response_hash["value"]
  end
  #does not work perfectly
  def self.customize_chuck(name)
    self.get_chuck.sub!("Chuck Norris", name)
    # binding.pry
  end

  def self.get_leslie(name)
    adjective = LeslieAdjective.adjective
    animal = LeslieAnimal.animal
    ending = LeslieEnding.ending
    "Oh #{name}, you #{adjective} #{animal}, #{ending}"
  end

  def self.get_compliment(compliment_content)
    find_or_create_by(compliment_content, 0)
  end

end

# zach = Compliment.customize_chuck("Zach Vary")
# binding.pry
