class CreateWallets < ActiveRecord::Migration

  def change
    create_table :wallets do |t|
      t.float :value
      t.float :performance
      t.integer :coin_id
      t.integer :user_id
    end
  end 
end
