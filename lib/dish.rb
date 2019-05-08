class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def self.get_dish_name #gets dish name from user
    puts "What is the name of the dish you would like to add?"
    name = gets.chomp
    puts " "
    name
  end


  def self.get_dish_category #gets dish category from user
    puts "What category does the dish belong to?"
    puts "1. Appetizer"
    puts "2. Entree"
    puts "3. Dessert"
    puts "4. Cocktail"
    input = gets.chomp
    case input
    when "1"
      cat = "appetizer"
    when "2"
      cat = "entree"
    when "3"
      cat = "dessert"
    when "4"
      cat = "cocktail"
    else
      puts "please select 1-4 please "
      get_dish_category
    end
    cat
  end

  def self.update_or_delete_dish(user)
    
  end



end
