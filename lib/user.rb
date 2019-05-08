class User < ActiveRecord::Base
  has_many :dishes
  has_many :restaurants, through: :dishes

  def print_dishes
    self.dishes.map do |dish|
      dish_name = dish[:name]
      rest_name = dish.restaurant[:name]
      dish_cat = dish[:category]

      puts "#{dish_name} at #{rest_name} (#{dish_cat})"

    end
  end

  def dish_list(cat)
    # self.dishes.select do |dish|

    # Dish.all.select do |dish|
    #   d_entree = dish[:category]['Entree']
    #   puts "#{d_entree}"

    # self.dishes.find_all do |dish|
    #    dish[:category] == 'Entree'

    self.dishes.each do |dish|
      dish[:category]
      if dish[:category] == cat
        puts "#{dish[:name]} at #{Restaurant.find(dish.restaurant_id).name}"
      end
      end
      end



end
