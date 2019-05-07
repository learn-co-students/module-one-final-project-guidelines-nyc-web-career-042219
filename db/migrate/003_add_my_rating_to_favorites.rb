class AddMyRatingToFavorites < ActiveRecord::Migration[5.0]

  def change
    add_column :favorites, :my_rating, :integer
  end



end
