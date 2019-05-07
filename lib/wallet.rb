require_relative '../bin/api_communicator'

class Wallet < ActiveRecord::Base
  belongs_to :users
  belongs_to :coins
end
