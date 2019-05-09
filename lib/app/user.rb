class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites

  def favorite_restaurants
    puts ""
    puts "Favorites"
    puts "*********"
    # binding.pry

    if favorites.length > 0
      self.favorites.each.with_index do |fav, i|
        puts "#{i+1}. #{fav.restaurant.name}"
      end
      puts ""
      puts "Enter a Number to Edit a Favorite"
      puts "or Type \'exit\' to Go to the Main Menu"
      print "> "
    else
      puts "You don't have any favorites yet!"
      puts "Press any key to return"
      returner = get_input
      main_menu(self) if returner
    end

    option = get_input
    if option.downcase == "exit"
      main_menu(self)
    elsif option
      option_num = option.to_i - 1
    else
      puts "Please enter a valid option"
    end
    if option_num < favorites.count
      favorite_menu(favorites[option_num])
    else
      puts "Please enter a valid option"
      main_menu(self)
    end
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
