require 'bundler'
require 'dotenv/load'
require 'colorize'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
