class DeleteUsernameRatingLastName < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :username
    remove_column :users, :last_name
    remove_column :compliments, :rating 
  end
end
