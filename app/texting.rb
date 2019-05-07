require("bundler")
Bundler.require()

class Texting

  @@account_sid = "AC329cf9c66f05ee25741c8a85cf109ef2"
  @@auth_token = "abf54dd41abb81076525ebbdce8c048a"
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  def self.send_message(number, compliment)
    @@client.messages.create(
      to: "+1#{number}",
      from: "+14085836517",
      body: compliment
    )
  end




end
