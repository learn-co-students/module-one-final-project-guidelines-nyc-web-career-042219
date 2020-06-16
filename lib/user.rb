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
end
