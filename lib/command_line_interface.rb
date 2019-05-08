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
  print ">"

  user_name = gets.chomp
  puts "Hello, #{user_name}!"
  user_name
end

def main_menu(user)
  puts "Welcome to the D.O.H.-jo"
  puts "************************"
  puts "Options:"
  puts "1. Search the Restaurant Database!"
  puts "2. View My Favorites List"
  puts "3. Mystery Option ?????"
  puts "4. Exit the Program"
  print ">"
  
  option = get_input
  case option
  when "1"
    # go to restaurant search
  when "2"
    user.favorite_restaurants
  when "3"
    # mystery option
  else
    exit
  end
end

def get_restaurant_input
  puts ""
  puts "Which restaurant would you like to check out?"
  print ">"
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
  print ">"

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
  print ">"

  option = get_input
  case option
  when "1"
    puts "Enter a new rating number"
    print ">"

    new_rating = get_input
    fav.update_attribute(:my_rating, new_rating)
    puts ""
    puts "Rating updated to #{fav.my_rating}"
    puts "*****************"
    # back to favorites list...
  when "2"
    puts "Are you sure? [ Y / N ]"
    print ">"

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
  puts "Bye bye!!!"
  exit!
end
