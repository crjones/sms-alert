class CallManagerController < ApplicationController

layout 'twiml'

  def sms
  	case params['Body'].upcase
  	when 'SUB'
  		@account = Account.find_by_number(params['To'])
  		Subscriber.create(account: @account, number: params['From'], optin: true)
	  	response = Twilio::TwiML::Response.new do |r|
		  r.Sms 'You are now subscribed. To unsubscribe reply STOP.'
		end
	when 'STOP'
  		@account = Account.find_by_number(params['To'])
  		Subscriber.find_by_account_id_and_number(@account.id, params['From']).destroy
	  	response = Twilio::TwiML::Response.new do |r|
		  r.Sms 'You have been unsubscribed. To subscribe reply SUB.'
		end
	else
	  	response = Twilio::TwiML::Response.new do |r|
		  r.Sms 'Unknown Command. Use SUB to subscribe or STOP to unsubscribe.'
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
