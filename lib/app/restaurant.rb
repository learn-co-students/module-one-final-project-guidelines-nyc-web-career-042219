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
  # def new_restaurant(rest_name)
  #   restaurant = Restaurant.new
  #   restaurant.name = restaurant_inspection[9]
  #   restaurant.address = restaurant_inspection[11], restaurant_inspection[12]
  #   restaurant.zipcode = restaurant_inspection[13]
  #   restaurant.cuisine = restaurant_inspection[15]
  #   restaurant.save
  #   restaurant
  # end

  def latest_inspection
    self.inspections.first
  end

  def profile
    puts ""
    puts ""
    puts "#{self.name}"
    puts ""
    puts "#{self.address}, #{self.zipcode}"
    puts ""
    puts "*" * 20
    puts ""
    puts "Grade: #{self.latest_inspection.grade} - Inspection Date: #{self.latest_inspection.date}"
    puts ""
    puts "*" * 20
    puts ""
  end



end
