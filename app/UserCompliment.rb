class UserCompliment < ActiveRecord::Base
  belongs_to :user
  belongs_to :compliment

end
