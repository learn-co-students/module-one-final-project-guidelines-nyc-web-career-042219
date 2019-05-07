class User < ActiveRecord::Base
  has_many :user_contacts
  has_many :contacts, through: :user_contacts, class_name: "User"

end
