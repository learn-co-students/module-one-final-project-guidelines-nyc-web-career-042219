class Violation < ActiveRecord::Base

  has_many :inspections
  has_many :restaurants, through: :inspections

  def inspection
    Inspection.where(violation_id: self.id)
  end

end
