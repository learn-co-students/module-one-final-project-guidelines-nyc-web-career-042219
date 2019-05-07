require_relative '../app/User.rb'
require_relative '../app/Compliment.rb'
require_relative '../app/UserCompliment.rb'
require_relative '../app/UserContact.rb'
require_relative '../app/texting.rb'

class CommandLineInterface

  attr_accessor :user, :contact_user, :command

  def logo_message
     puts "
  ,--.   ,--,--.
  |  |   |  |  ,---.,--. ,--.
  |  |.'.|  |  .-.  |\  '  /
  |   ,'.   |  | |  | \   ,--.
  '--'   '--`--' `--.-'  /'-,/                                    ,---.
  ,--------,--.     `---'        ,--.        ,--.   ,--.          |   |
  '--.  .--|  ,---. ,--,--,--,--,|  |,-.      \  `.'  ,---.,--.,--|  .'
     |  |  |  .-.  ' ,-.  |      |     /       '.    | .-. |  ||  |  |
     |  |  |  | |  \ '-'  |  ||  |  \  \         |  |' '-' '  ''  `--'
     `--'  `--' `--'`--`--`--''--`--'`--'        `--' `---' `----'.--.
                                                                  '--'  "


  end

  def welcome
    puts "Welcome to Why, Thank You! The best place to give compliments to your friends or yourself, without needing to be creative!"
    user_creation
  end

  def user_creation

    puts "Please enter your name: "
    user_name = gets.chomp
    puts "Please enter your phone number"
    user_phone_number = gets.chomp

    @user = User.find_or_create_by(first_name: user_name, phone_number: user_phone_number)

    get_s_r_command

  end

  def get_s_r_command
    puts "Would you like to send or receive a compliment?"
    puts "Enter 's' to send a compliment"
    puts "Enter 'r' to receive a compliment"
    puts "Enter 'v' to view all the compliments you have generated"
    @command = gets.chomp
    process_s_r_command
  end

  def process_s_r_command

    if @command == 's'
      puts "Please enter a name"
      first_name = gets.chomp
      puts "Please enter a phone number"
      phone_number = gets.chomp

      contact_creation(first_name, phone_number)

      puts "#{first_name} has been saved in your contacts!"
      get_c_l_command()

    elsif @command == 'r'
      get_c_l_command()


    elsif @command == 'v'
      @user.compliments.each { |compliment| puts compliment.content }

    else
      puts "Please enter a valid command"
      get_s_r_command()

    end

  end

  def get_c_l_command
    puts "Enter '1' for a badass compliment, '2' for a quirky compliment, or '3' to go back."
    c_l_command = gets.chomp
    if @command == 's'
      process_c_l_command_sending(c_l_command)
    elsif @command == 'r'
      process_c_l_command_receiving(c_l_command)
    else
      puts "Please enter a valid command"
      get_c_l_command()
    end
  end

  def process_c_l_command_sending(command)
    if command == '1'
      chuck = Compliment.customize_chuck(@contact_user.first_name)
      compliment = Compliment.create(content:chuck)
      UserCompliment.create(user_id: @contact_user.id, compliment_id: compliment.id)
      Texting.send_message(@contact_user.phone_number, chuck)
    elsif command == '2'
      leslie = Compliment.get_leslie(@contact_user.first_name)
      compliment = Compliment.create(content:leslie)
      UserCompliment.create(user_id: @contact_user.id, compliment_id: compliment.id)
      Texting.send_message(@contact_user.phone_number, leslie)
    elsif command == '3'
      get_s_r_command()
    end
  end

  def process_c_l_command_receiving(command)
    if command == '1'
      chuck = Compliment.customize_chuck(@user.first_name)
      compliment = Compliment.create(content:chuck)
      UserCompliment.create(user_id: @user.id, compliment_id: compliment.id)
      Texting.send_message(@user.phone_number, chuck)
      thank_you_options()
    elsif command == '2'
      leslie = Compliment.get_leslie(@user.first_name)
      compliment = Compliment.create(content:leslie)
      UserCompliment.create(user_id: @user.id, compliment_id: compliment.id)
      Texting.send_message(@user.phone_number, leslie)
      thank_you_options()
    elsif command == '3'
      get_s_r_command()
    end
  end

  def thank_you_options
    puts "Why, Thank You for using our service!"
    puts "Enter '1' to generate another compliment"
    puts "Enter '2' to exit the program"
    command = gets.chomp
    process_thank_you_command(command)
  end

  def process_thank_you_command(command)
    if command == '1'
      get_s_r_command()
    elsif command == '2'
      @command = 'q'
    else
      puts "Please enter a valid command"
      thank_you_options()
    end
  end

  def contact_creation(name, phone_number)
    @contact_user = User.find_or_create_by(first_name: name, phone_number: phone_number)
    UserContact.create(user_id: @user.id, contact_id: @contact_user.id)
  end

  def runner
    while @command != 'q'
      self.logo_message
      self.welcome
    end
   puts "Why, Thank You for using our service. good bye!"
   exit(true)
  end

end
