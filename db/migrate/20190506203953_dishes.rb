class Dishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :user_id
      t.integer :restaurant_id
      t.string :category
    end
  end



end
