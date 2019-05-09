class Inspection < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :violation

  def yuck_my_yum
    #select ...50?... restaurants with highest inspection scores
    #return a random inspection with grade, score, violation description
  end

end
