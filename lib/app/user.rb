class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites

  def find_or_create_by()
    # user = User.new
    # user.name = :name
    # # check database for user
    #   # true = load user profile
    #   # false = user.save

  end

  def favorite_restaurants
    #lists favorite restaurants
  end

  def add_to_favorites
    #adds a restaurant to a user's favorite list
  end



end
