class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites

  def favorite_restaurants
    self.favorites.each.with_index do |fav, i|
      puts "#{i+1}. #{fav.restaurant.name}"
    end
    puts ""
    puts "Enter a Number to Edit a Favorite"
    puts "or Type \'Exit\' to Go to the Main Menu"
    option = get_input.to_i - 1
    favorite_menu(favorites[option])
  end

  def add_to_favorites(restaurant)
    fav = Favorite.new({user_id: self.id, restaurant_id: restaurant.id})
    if Favorite.exists?
      puts "You have already added this restaurant as a favorite"
    else
      fav.save
      puts "Added to favorites"
      puts "******************"
    end
  end



end
