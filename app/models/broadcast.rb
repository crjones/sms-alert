class Broadcast < ActiveRecord::Base
	belongs_to :account
	belongs_to :user

	def deliver(subscriber)
    @twilio = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH']

    @twilio.account.sms.messages.create(
      :from => self.account.number,
      :to => subscriber.number,
      :body => self.message
    )
  end
  handle_asynchronously :deliver

end
