class User < ActiveRecord::Base
  has_many :dishes
  has_many :restaurants, through: :dishes

  def print_dishes
    counter = 1
    #prints out all the users dishes. saves all the users dish IDs in an array
    dishes = self.dishes.reload.map do |dish|
      puts "#{counter}. #{dish[:name]} at #{dish.restaurant[:name]} (#{dish[:category]})"
      counter += 1
      dish.id
    end
    dishes
  end


  def check_into_rest
    #lists the restaurants by the chosen cuisine
    rest_id = Restaurant.get_rest_info(self)
    name = Dish.get_dish_name #retrieves dish name from user
    category = Dish.get_dish_category #retrieves dish category from user
    dish= Dish.create(name: name, user_id: self.id, restaurant_id: rest_id, category: category)

    puts "Your new favorite dish of #{name} at #{Restaurant.find(rest_id).name} has been added"
  end

  def dish_list(cat)
    #lists dishes according to category (entree,dessert etc)
    self.dishes.reload.each do |dish|
      if dish[:category] == cat
        puts "#{dish[:name]} at #{Restaurant.find(dish.restaurant_id).name}"
      end
    end
  end

  def decide_where_to_eat
    #randomly generates a restaurant at which to eat. Lists dishes you like there.
    rest = self.restaurants.uniq.sample
    puts "Go eat at #{rest.name}!"
    puts "Dishes you liked there are:"
    counter = 1
    self.dishes.reload.where("restaurant_id = #{rest.id}").each do |dish|
      puts "#{counter}. #{dish.name} (#{dish.category})"
      counter += 1

    end

  end

end
