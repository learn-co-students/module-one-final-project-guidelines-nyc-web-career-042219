class CreateUserCompliments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_compliments do |t|
      t.integer :user_id
      t.integer :compliment_id 
    end
  end
end
