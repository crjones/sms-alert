class User < ActiveRecord::Base
	has_and_belongs_to_many :accounts

	has_secure_password

	attr_accessible :email, :password, :password_confirmation
end
