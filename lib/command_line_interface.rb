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
  puts "please enter your name"
  user_name = gets.chomp
  puts "Hello, #{user_name}"
end

def get_restaurant_name
  puts "which restaurant would you like to check out?"
  restaurant_name = gets.chomp
  if restaurant_name = "exit" || "q" || "quit"
    exit
  end
end

def exit
  puts "bye bye!!!"
  exit!
end
