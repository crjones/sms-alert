class Account < ActiveRecord::Base
	belongs_to :manager, :class_name => 'User', :foreign_key => 'user_id'
	has_and_belongs_to_many :users
	has_many :subscribers
	has_many :broadcasts

	default_scope :order => 'created_at DESC'
	scope :active, where(active: true)
	scope :broadcast, where(broadcast: true)
	scope :conference, where(conference: true)
end
