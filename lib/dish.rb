class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def self.get_dish_name #gets dish name from user
    puts "What is the name of the dish you would like to add?"
    name = gets.chomp
    puts " "
    name
  end

  def dish_update
    puts "What would you like to update?"
    puts "1. Dish name"
    puts "2. Dish category"
    change_type = gets.chomp
    case change_type
    when "1"
      puts "What would you like to update the name to?"
      name = gets.chomp
      Dish.update(self.id, name: name)
    when "2"
      #gets new category through get_dish_category
      cat = Dish.get_dish_category
      #updates dish with cat gotten from get_dish_category
      Dish.update(self.id, category: cat)
    else
      puts "Please select 1 or 2"
      self.dish_update
    end


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
    #gets dishes which is an array of dish IDS that belong to the user
    dishes = user.print_dishes

    puts "Which dish would you like to edit?"
    dish_change = gets.chomp
    puts "Would you like to:"
    puts "1. Update the dish"
    puts "2. Delete the dish"
    puts "3. Return to main menu"
    action = gets.chomp
    #gets dish ID from dishes array, changes it to an int. gets dish object.
    dish_id_to_change = dishes[dish_change.to_i - 1]
    dish_id_to_change = dish_id_to_change.to_i
    dish_to_change = Dish.find(dish_id_to_change)


    case  action
    when "1"
      dish_to_change.dish_update

    when "2"
      Dish.delete(dish_id_to_change)

    when "3"
      main_menu(user)
    else
      puts "Please select 1,2, or 3"
      Dish.update_or_delete_dish
    end
  end



end
