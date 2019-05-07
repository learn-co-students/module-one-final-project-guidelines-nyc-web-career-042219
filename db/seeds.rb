require_relative '../config/environment'
require_relative '../lib/restaurant.rb'
require_relative '../lib/user.rb'
require_relative '../lib/dish.rb'


catherine = User.find_or_create_by(name: 'Catherine')
yasmine = User.find_or_create_by(name: 'Yasmine')


def seed_rest
  response = RestClient.get("https://developers.zomato.com/api/v2.1/search?entity_id=94741&entity_type=zone", {'user-key': "#{ENV['API_KEY']}", accept: :json})
  string = response.body
  data = JSON.parse(string)
  data['restaurants'].map do |rest|
    location = rest['restaurant']['location']['city']
    name = rest['restaurant']['name']
    cuisine = rest['restaurant']['cuisines'].split(",").first
    Restaurant.find_or_create_by(name: name, location: location, cuisine: cuisine)
  end


end

seed_rest
