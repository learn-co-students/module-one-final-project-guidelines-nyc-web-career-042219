class Restaurant < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites
  has_many :inspections
  has_many :violations, through: :inspections


  
  def latest_inspection
    self.inspections.first
  end

  def profile
    puts ""
    puts ""
    puts "#{self.name}"
    puts ""
    puts "#{self.address}, #{self.zipcode}"
    puts ""
    puts "*" * 20
    puts ""
    puts "Grade: #{self.latest_inspection.grade} - Inspection Date: #{self.latest_inspection.date}"
    puts ""
    puts "*" * 20
    puts ""
  end




end
