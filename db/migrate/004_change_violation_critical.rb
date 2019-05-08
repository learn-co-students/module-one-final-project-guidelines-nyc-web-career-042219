class ChangeViolationCritical < ActiveRecord::Migration[5.0]

  def change
    change_column :violations, :critical, :string
  end



end
