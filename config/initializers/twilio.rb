if Gem.available?('twilio-ruby') && ENV['TWILIO_SID'] && ENV['TWILIO_AUTH']
	account_sid = ENV['TWILIO_SID']
	auth_token = ENV['TWILIO_AUTH']

	# set up a client to talk to the Twilio REST API
	@twilio = Twilio::REST::Client.new account_sid, auth_token
end