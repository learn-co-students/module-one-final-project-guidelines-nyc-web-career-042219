class ChangeDatetimeToS < ActiveRecord::Migration[5.0]

  def change
    change_column :inspections, :date, :string
  end



end
