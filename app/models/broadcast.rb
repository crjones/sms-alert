class Broadcast < ActiveRecord::Base
	belongs_to :account
	belongs_to :user

	def deliver(subscriber)
    @twilio.account.sms.messages.create(
      :from => self.account,
      :to => subscriber.number,
      :body => self.message
    )
  end
  handle_asynchronously :deliver

end
