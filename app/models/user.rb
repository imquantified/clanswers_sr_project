class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true, length: { maximum: 64 }, uniqueness: true
	validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# validates :password_digest, presence: true 
	validates :password, length: { minimum: 6 }

	has_secure_password
end