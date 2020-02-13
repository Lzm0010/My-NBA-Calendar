class SendSMS

    def send_message(message, number)
        account_sid = ENV['TWILIOSID']
        auth_token = ENV['TWILIOAUTH']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['TWILIONUM'] # Your Twilio number
        to =  number # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: message
        )
    end

end