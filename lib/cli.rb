def welcome

  signature = <<-foo
  .         .
  `8.`8888.      ,8'  ,o888888o.     8 8888      88 8 888888888o.            ,8.       ,8.          8 8888888888 8888888 8888888888
   `8.`8888.    ,8'. 8888     `88.   8 8888      88 8 8888    `88.          ,888.     ,888.         8 8888             8 8888
    `8.`8888.  ,8',8 8888       `8b  8 8888      88 8 8888     `88         .`8888.   .`8888.        8 8888             8 8888
     `8.`8888.,8' 88 8888        `8b 8 8888      88 8 8888     ,88        ,8.`8888. ,8.`8888.       8 8888             8 8888
      `8.`88888'  88 8888         88 8 8888      88 8 8888.   ,88'       ,8'8.`8888,8^8.`8888.      8 888888888888     8 8888
       `8. 8888   88 8888         88 8 8888      88 8 888888888P'       ,8' `8.`8888' `8.`8888.     8 8888             8 8888
        `8 8888   88 8888        ,8P 8 8888      88 8 8888`8b          ,8'   `8.`88'   `8.`8888.    8 8888             8 8888
         8 8888   `8 8888       ,8P  ` 8888     ,8P 8 8888 `8b.       ,8'     `8.`'     `8.`8888.   8 8888             8 8888
         8 8888    ` 8888     ,88'     8888   ,d8P  8 8888   `8b.    ,8'       `8        `8.`8888.  8 8888             8 8888
         8 8888       `8888888P'        `Y88888P'   8 8888     `88. ,8'         `         `8.`8888. 8 888888888888     8 8888

  foo
  puts signature.colorize(:blue)

  puts "+" * 60
  puts " "
  puts "Welcome to Yourmet! What is your name?".bold.on_yellow.colorize(:blue)
end

def get_user

  user = gets.chomp
  if User.find_by(name: user)
    return User.find_by(name: user)
  else
    return User.create(name: user)
  end

end


def main_menu(user)
  puts "|+" * 60
  puts "1.".colorize(:blue)+" Search for a restaurant by cuisine"
  puts "2.".colorize(:cyan)+" Look up your favorite dishes"
  puts "3.".colorize(:green)+" Check into a restaurant and add a favorite dish"
  puts "4. Exit".colorize(:red)
  puts "/" * 60

  input = gets.chomp

  case input
  when "1"
    Restaurant.find_rest_by_cuisine(user)
  when "2"
    # user.print_dishes
    dish_cat(user)
  when "3"
    #binding.pry
    user.check_into_rest
    main_menu(user)
  when "4"
    exit
  else
    puts "please select 1, 2, 3, or 4 "
    main_menu(user)
  end

end


def dish_cat(user)
  puts "=-" * 60
  puts "1. Cocktails"
  puts "2. Appetizers"
  puts "3. Entrees"
  puts "4. Desserts"
  puts "5. List all dishes"
  puts "= " * 60

  input = gets.chomp

    case input
    when "1"
      cat = 'cocktail'
      user.dish_list(cat)
    when "2"
      cat = 'appetizer'
      user.dish_list(cat)
    when "3"
      cat = 'Entree'
      user.dish_list(cat)
    when "4"
      cat = 'Dessert'
      user.dish_list(cat)
    when "5"
      user.print_dishes
    main_menu(user)
    else
      puts "please select 1, 2, 3, 4, or 5 "
      main_menu(user)
    end

end

def rest_search_menu
  puts " "
  puts "1. Search for a restaurant by location"
  puts "2. Search for a restaurant by cuisine"
  puts "3. Return to main menu"
  puts "4. Exit".colorize(:red)
  puts " "

  input = gets.chomp

    case input
    when "1"
      puts "selected 1"
    when "2"
      puts "Enter desired cuisine"
      cuisine = gets.chomp
      Restaurant.search_by_cuisine(cuisine)
    when "3"
      main_menu
    when "4"
      exit
    else
      puts "please select 1, 2, 3, or 4 "
      main_menu
    end


end
