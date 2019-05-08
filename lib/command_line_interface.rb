def welcome
  puts "
   _             _                _  _
  (_)           (_)              (_)(_)
  (_)           (_)  _  _  _  _     (_)     _  _  _    _  _  _      _  _   _  _    _  _  _  _
  (_)     _     (_) (_)(_)(_)(_)_   (_)   _(_)(_)(_)_ (_)(_)(_) _  (_)(_)_(_)(_)  (_)(_)(_)(_)_
  (_)   _(_)_   (_)(_) _  _  _ (_)  (_)  (_)       (_)         (_)(_)   (_)   (_)(_) _  _  _ (_)
  (_)  (_) (_)  (_)(_)(_)(_)(_)(_)  (_)  (_)       (_)         (_)(_)   (_)   (_)(_)(_)(_)(_)(_)
  (_)_(_)   (_)_(_)(_)_  _  _  _  _ (_) _(_)_  _  _(_) _  _  _ (_)(_)   (_)   (_)(_)_  _  _  _
    (_) _     (_)    (_)(_)(_)(_)(_)(_)(_) (_)(_)(_)  (_)(_)(_)   (_)   (_)   (_)  (_)(_)(_)(_)
       (_)
     _ (_) _  _      _  _  _
    (_)(_)(_)(_)  _ (_)(_)(_) _
       (_)       (_)         (_)
       (_)     _ (_)         (_)
       (_)_  _(_)(_) _  _  _ (_)
        _(_)(_)   _ (_)(_)(_)
       (_)       (_)
     _ (_) _  _  (_) _  _  _     _  _  _  _
    (_)(_)(_)(_) (_)(_)(_)(_)_  (_)(_)(_)(_)_
       (_)       (_)        (_)(_) _  _  _ (_)
       (_)     _ (_)        (_)(_)(_)(_)(_)(_)
       (_)_  _(_)(_)        (_)(_)_  _  _  _
         (_)(_)  (_)        (_)  (_)(_)(_)(_)
    _  _  _  _       _  _  _  _    _           _                        _  _  _   _  _  _  _
   (_)(_)(_)(_)    _(_)(_)(_)(_)_ (_)         (_)                      (_)(_)(_)_(_)(_)(_)(_)_
    (_)      (_)_ (_)          (_)(_)         (_)                         (_)  (_)          (_)
    (_)        (_)(_)          (_)(_) _  _  _ (_)  _  _  _  _  _          (_)  (_)          (_)
    (_)        (_)(_)          (_)(_)(_)(_)(_)(_) (_)(_)(_)(_)(_)         (_)  (_)          (_)
    (_)       _(_)(_)          (_)(_)         (_)                  _      (_)  (_)          (_)
    (_)_  _  (_)  (_)_  _  _  _(_)(_)         (_)                 (_)  _  (_)  (_)_  _  _  _(_)
   (_)(_)(_)(_)     (_)(_)(_)(_)  (_)         (_)                  (_)(_)(_)     (_)(_)(_)(_)



  "
end

def get_user_name_from_user
  puts "Please enter your name"
  user_name = gets.chomp
  puts "Hello, #{user_name}!"
  user_name
end

def main_menu
  puts "Welcome to the D.O.H.-jo"
  puts "************************"
  puts "Options:"

end

def get_restaurant_input
  puts ""
  puts "Which restaurant would you like to check out?"
  input = gets.chomp
  # if input = "exit" || "q" || "quit"
  #   exit
  # end
  input
end

def get_input
  input = gets.chomp
end

def restaurant_menu(user, restaurant)
  puts ""
  puts "Options:"
  puts "1. Add to Favorites"
  puts "2. View Favorites"
  puts "3. Exit to Main Menu"
  puts "Please enter a number"

  option = get_input
  case option
  when "1"
    user.add_to_favorites(restaurant)
  when "2"
    puts ""
    puts "View Favorites"
    puts "**************"
    puts user.favorite_restaurants
  when "3" || "exit"
    puts ""
    puts "Exit to main menu"
    puts "*****************"
    # exit to main menu...
  else
    "Please enter a number from the menu"
  end
end

def favorite_menu(fav)
  #binding.pry
  puts "Restaurant: #{fav.restaurant.name}"
  puts "My Rating: #{fav.my_rating}"
  puts ""
  puts "Options:"
  puts "1. Edit Rating"
  puts "2. Delete Favorite"
  puts "3. Exit to Main Menu"
  option = get_input
  case option
  when "1"
    puts "Enter a new rating number"
    new_rating = get_input
    fav.update_attribute(:my_rating, new_rating)
    puts ""
    puts "Rating updated to #{fav.my_rating}"
    puts "*****************"
    # back to favorites list...
  when "2"
    puts "Are you sure? [ Y / N ]"
    sure = get_input
    if sure.upcase == "Y"
      Favorite.delete(self.id)
      puts "Favorite deleted"
      puts "****************"
      # back to favorites list...
    else
      # back to single favorite menu...
    end
  when "3"
    # back to single favorite menu...
  else
    "Please enter a number from the menu"
  end
end

def exit
  puts "bye bye!!!"
  exit!
end
