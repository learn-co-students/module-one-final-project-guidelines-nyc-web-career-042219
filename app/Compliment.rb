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
  def self.customize_chuck(first_name, last_name)
    new_chuck = self.get_chuck.split(" ")
    done_chuck = new_chuck.map do |word|
      if word == "Chuck" || word == "chuck" || word == "He" || word == "he"
        word = first_name
      elsif word == "His" || word == "his" || word == "Chucks'" || word == "chucks"
        word = "#{first_name}'s"
      elsif word == "He's" || word == "he's"
        word = "#{first_name}'s'"
      elsif word == "Norris"
        word = last_name
      elsif word == "Norris's" && last_name.last == 's'
        word = "#{last_name}'"
      elsif word == "Norris's" && last_name.last != 's'
        word = "#{last_name}'s"
      elsif word == "Norris'" && last_name.last == 's'
        word = "#{last_name}'"
      elsif word == "Norris'" && last_name.last != 's'
        word = "#{last_name}'s"
      else
        word = word
      end
    end
    done_chuck.join(" ")
  end

  def self.get_leslie(first_name, last_name)
    adjective = LeslieAdjective.adjective
    animal = LeslieAnimal.animal
    ending = LeslieEnding.ending
    "Oh #{first_name} #{last_name}, you #{adjective} #{animal}, #{ending}"
  end

  def self.get_compliment(compliment_content)
    find_or_create_by(compliment_content)
  end

end

zach = Compliment.customize_chuck("Zach", "Vary")
binding.pry
