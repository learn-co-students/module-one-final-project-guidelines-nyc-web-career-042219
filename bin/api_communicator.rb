require_relative '../config/environment'
require "../lib"




def getdata
request = RestClient::Request.execute(
   :method => :get,
   :url => "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
   :headers => {'X-CMC_PRO_API_KEY' => "e1bc2b6a-0db8-4d6f-af85-907403dfa668"}
)
string = request.body
data = JSON.parse(string)
data
end


# binding.pry
