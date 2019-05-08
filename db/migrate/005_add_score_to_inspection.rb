class AddScoreToInspection < ActiveRecord::Migration[5.0]

  def change
    add_column :inspections, :score, :integer
  end



end
