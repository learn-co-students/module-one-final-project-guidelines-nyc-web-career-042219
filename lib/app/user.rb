class User < ActiveRecord::Base

  has_many :favorites
  has_many :restaurants, through: :favorites

  def favorite_restaurants
    self.favorites.map do |fav|
      fav.restaurant.name
    end
  end

  def add_to_favorites(restaurant)
    Favorite.create({user_id: self.id, restaurant_id: restaurant.id})
  end



end
