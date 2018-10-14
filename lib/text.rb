require 'twilio-ruby'
class Text
  def time
    Time.new + 60 * 60
  end

  def send_text
    Twilio::REST::Client.new(ENV['AC1404ee27753183cf6a6fa4c7b2062b82'], ENV['09f0b26a5e4e2d0a4c2e20454277a923']).messages.create(
        from: ENV['+441133205928'],
        to: ENV['+447341900807'],
        body: "Thank you, Your order will be delivered before #{time}"
      )
  end
end
