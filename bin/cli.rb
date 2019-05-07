class CLI
attr_accessor :current_user

def welcome
  puts "Welcome to Coin Wallet! what is your name?"
  username = gets.chomp
  current_user = User.find_by(username: username)
  puts "welcome #{:user}, what coin would you like to search for?"
  search = gets.chomp
end
CLI.new.welcome 

end
