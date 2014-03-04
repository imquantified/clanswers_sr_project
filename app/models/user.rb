class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true, length: { maximum: 64 }, uniqueness: true
	validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# validates :password_digest, presence: true 
	validates :password, length: { minimum: 6 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end
end