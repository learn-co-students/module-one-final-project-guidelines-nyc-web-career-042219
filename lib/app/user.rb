class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites

  def favorite_restaurants
    #lists favorite restaurants
  end

  def add_to_favorites
    #adds a restaurant to a user's favorite list
  end



end
