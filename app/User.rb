class User < ActiveRecord::Base
  has_many :user_contacts
  has_many :contacts, through: :user_contacts, class_name: "User"
  has_many :user_compliments
  has_many :compliments, through: :user_compliments



end
