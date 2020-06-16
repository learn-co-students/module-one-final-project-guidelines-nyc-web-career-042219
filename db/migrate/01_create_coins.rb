class CreateCoins < ActiveRecord::Migration

  def change
    create_table :coins do |t|
      t.string :name
      t.float :price
      t.integer :market_cap
      t.integer :volume_24h
      t.float :change_24h
    end
  end 
end
