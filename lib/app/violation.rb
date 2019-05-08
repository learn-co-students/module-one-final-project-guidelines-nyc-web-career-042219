class Violation < ActiveRecord::Base

  has_many :inspections
  has_many :restaurants, through: :inspections



end
