require_relative '../bin/api_communicator'

class Coin < ActiveRecord::Base
  has_many :wallets
  has_many :users, through: :wallets


end
