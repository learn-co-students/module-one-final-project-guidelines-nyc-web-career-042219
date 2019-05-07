class CreateTables < ActiveRecord::Migration[5.0]

  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.string :cuisine
    end

    create_table :users do |t|
      t.string :name
    end

    create_table :violations do |t|
      t.string :code
      t.string :description
      t.boolean :critical
    end

    create_table :inspections do |t|
      t.integer :restaurant_id
      t.integer :violation_id
      t.datetime :date
      t.string :grade
    end

    create_table :favorites do |t|
      t.integer :user_id
      t.integer :restaurant_id
    end

  end
end
