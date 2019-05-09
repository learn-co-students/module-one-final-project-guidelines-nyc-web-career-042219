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
  puts "Please enter your name to begin:"
  print "> "

  user_name = gets.chomp
  puts ""
  puts "Hello, #{user_name}!"
  user_name
end

def main_menu(user)
  puts ""
  puts "Welcome to the D.O.H.-jo"
  puts "************************"
  puts "      MAIN MENU"
  puts "************************"
  puts ""
  puts "Options:"
  puts ""
  puts "1. Search the Restaurant Database!"
  puts "2. View My Favorites List"
  puts "3. Mystery Option ?????"
  puts "4. Exit the Program"
  print "> "

  option = get_input
  case option
  when "1"
    # go to restaurant search
  when "2"
    user.favorite_restaurants
  when "3"
    exit # mystery!
  when "4"
    exit
  else
    main_menu(user)
  end
end

def get_restaurant_input
  puts ""
  puts "Which restaurant would you like to check out?"
  print "> "
  input = gets.chomp
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
  print "> "

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
    main_menu(user)
  else
    "Please enter a number from the menu"
  end
end

def favorite_menu(fav)
  puts ""
  puts "Restaurant: #{fav.restaurant.name}"
  puts "Cuisine: #{fav.restaurant.cuisine}"
  # latest grade
  puts "My Rating: #{fav.my_rating}"
  puts ""
  puts "Options:"
  puts "1. Edit Rating"
  puts "2. Delete Favorite"
  puts "3. Back to Favorites Menu"
  puts "4. Exit to Main Menu"
  print "> "

  option = get_input
  case option
  when "1"
    puts ""
    puts "Enter a new rating number"
    print "> "

    new_rating = get_input
    fav.update_attribute(:my_rating, new_rating)
    puts ""
    puts "Rating updated to #{fav.my_rating}"
    puts "*****************"
    fav.user.favorite_restaurants
  when "2"
    puts ""
    puts "Are you sure? [ Y / N ]"
    print "> "

    sure = get_input
    if sure.upcase == "Y"
      Favorite.delete(self.id)
      puts "Favorite deleted"
      puts "****************"
      fav.user.favorite_restaurants
    else
      favorite_menu(fav)
    end
  when "3"
    fav.user(favorite_restaurants)
  when "4"
    main_menu(fav.user)
  else
    puts "Please enter a number from the menu"
  end
end

def exit
  puts "Bye bye!!!"
  exit!
end
