class User < ActiveRecord::Base
  has_many :dishes
  has_many :restaurants, through: :dishes

  def print_dishes
    self.dishes.reload.map do |dish|
      dish_name = dish[:name]
      rest_name = dish.restaurant[:name]
      dish_cat = dish[:category]

      puts "#{dish_name} at #{rest_name} (#{dish_cat})"

    end
  end


  def check_into_rest
    #lists the restaurants by the chosen cuisine
    rest_id = Restaurant.get_rest_info
    name = Dish.get_dish_name #retrieves dish name from user
    category = Dish.get_dish_category #retrieves dish category from user
    dish= Dish.create(name: name, user_id: self.id, restaurant_id: rest_id, category: category)

    puts "Your new favorite dish of #{name} at #{Restaurant.find(rest_id).name} has been added"
  end

  def dish_list(cat)
    # self.dishes.select do |dish|

    # Dish.all.select do |dish|
    #   d_entree = dish[:category]['Entree']
    #   puts "#{d_entree}"

    # self.dishes.find_all do |dish|
    #    dish[:category] == 'Entree'
    #binding.pry
    self.dishes.reload.each do |dish|
      dish[:category]
      if dish[:category] == cat
        puts "#{dish[:name]} at #{Restaurant.find(dish.restaurant_id).name}"
      end
      end
      end



end
