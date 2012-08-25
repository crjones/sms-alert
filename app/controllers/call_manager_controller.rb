class CallManagerController < ApplicationController

layout 'twiml'

  def sms
	response = Twilio::TwiML::Response.new do |r|
  		if @account = Account.active.broadcast.find_by_number(params['To'])
		  	case params['Body'].upcase
		  	when 'SUB'
		  		Subscriber.create(account: @account, number: params['From'], optin: true)
				r.Sms 'You are now subscribed. To unsubscribe reply STOP.'
			when 'STOP'
		  		Subscriber.find_by_account_id_and_number(@account.id, params['From']).destroy
				r.Sms 'You have been unsubscribed. To subscribe reply SUB.'
			else
				r.Sms 'Unknown Command. Use SUB to subscribe or STOP to unsubscribe.'
			end	
		else
			r.Sms "This number is not yet setup. Please go to: #{new_account_url}"
		end
	end

	# print the result
	render :text => response.text
  end

  def voice
  	response = Twilio::TwiML::Response.new do |r|
	  r.Say 'hello there', :voice => 'woman'
	end

	# print the result
	render :text => response.text
  end
end
