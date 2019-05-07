class Restaurant < ActiveRecord::Base

has_many :favorites
has_many :users, through: :favorites
has_many :inspections
has_many :violations, through: :inspections

end
