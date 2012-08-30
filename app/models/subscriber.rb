class Subscriber < ActiveRecord::Base
	belongs_to :account

	default_scope :order => 'created_at DESC'
end
