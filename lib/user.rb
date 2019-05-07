require_relative '../bin/api_communicator'

attr_reader :username

class User < ActiveRecord::Base
  has_many :wallets
  has_many :coins, through: :wallets

end 
