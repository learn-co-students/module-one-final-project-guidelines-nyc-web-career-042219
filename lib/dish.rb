class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def self.get_dish_name #gets dish name from user
    puts "What is the name of the dish you would like to add?".bold.colorize(:blue)
    name = gets.chomp
    puts " "
    name
  end

  def dish_update
    puts "What would you like to update?".colorize(:blue)
    puts "1. ".colorize(:green)+"Dish name"
    puts "2. ".colorize(:light_yellow)+"Dish category"
    change_type = gets.chomp
    case change_type
    when "1"
      puts "What would you like to update the name to?".bold.colorize(:blue)
      name = gets.chomp
      Dish.update(self.id, name: name)
    when "2"
      #gets new category through get_dish_category
      cat = Dish.get_dish_category
      #updates dish with cat gotten from get_dish_category
      Dish.update(self.id, category: cat)
    else
      puts "Please select 1 or 2".bold.colorize(:white)
      self.dish_update
    end


  end



  def self.get_dish_category #gets dish category from user
    puts "What category does the dish belong to?".bold.colorize(:blue)
    puts "1. ".colorize(:blue)+"Appetizer"
    puts "2. ".colorize(:cyan)+"Entree"
    puts "3. ".colorize(:green)+"Dessert"
    puts "4. ".colorize(:yellow)+"Cocktail"
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
      puts "please select 1-4 please".bold
      get_dish_category
    end
    cat
  end

  def self.update_or_delete_dish(user)
    #gets dishes which is an array of dish IDS that belong to the user
    puts "=-".colorize(:light_black) * 65
    dishes = user.print_dishes
    puts " "
    puts "Which dish would you like to edit?".bold.colorize(:blue)
    dish_change = gets.chomp
    puts "Would you like to:".bold.colorize(:blue)
    puts "1. ".colorize(:yellow)+"Update the dish"
    puts "2. ".colorize(:magenta)+"Delete the dish"
    puts "3. ".colorize(:light_blue)+"Return to main menu"
    action = gets.chomp
    # binding.pry
    #gets dish ID from dishes array, changes it to an int. gets dish object.
    dish_id_to_change = dishes[dish_change.to_i - 1]
    dish_to_change = Dish.find(dish_id_to_change)


    case action
    when "1"
      dish_to_change = Dish.find(dish_id_to_change)
      dish_to_change.dish_update

    when "2"
      Dish.delete(dish_id_to_change)

    when "3"
      main_menu(user)
    else
      puts "Please select 1,2, or 3"
      Dish.update_or_delete_dish(user)
    end
  end



end
