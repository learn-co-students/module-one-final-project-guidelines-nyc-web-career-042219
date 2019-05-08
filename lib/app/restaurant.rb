class Restaurant < ActiveRecord::Base

has_many :favorites
has_many :users, through: :favorites
has_many :inspections
has_many :violations, through: :inspections


  # def restaurant_profile
  #   puts "#{restaurant_inspection[9]}"
  #   puts "*" * 10
  #   puts "#{restaurant_inspection[-4]} - #{restaurant_inspection[-3]}"
  #
  # end

end
