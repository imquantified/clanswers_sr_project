class User < ActiveRecord::Base
	has_many :quick_questions, dependent: :destroy
	has_many :interest_questions, dependent: :destroy
	has_many :thoughtful_questions, dependent: :destroy

	has_many :quick_answers, dependent: :destroy
	has_many :interest_answers, dependent: :destroy
	has_many :thoughtful_answers, dependent: :destroy

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true, length: { maximum: 64 }, uniqueness: true
	validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# validates :password_digest, presence: true 
	validates :password, length: { minimum: 6 }

	has_secure_password

	#simple question query methods
	def qq_feed
		QuickQuestion.where("user_id = ?", id)
	end

	def iq_feed
		InterestQuestion.where("user_id = ?", id)
	end

	def tq_feed
		ThoughtfulQuestion.where("user_id = ?", id)
	end

	def all_question_feed
		#Could be used to pull other user data? Pulls every person, essentially a quick question feed for everyone
		QuickQuestion.joins('LEFT OUTER JOIN users ON quick_questions.user_id = users.id')
	end

	#simple answer query methods, for now
	def qa_feed
		QuickAnswer.where("user_id = ?", id)
	end

	def ia_feed
		InterestAnswer.where("user_id = ?", id)
	end

	def ta_feed
		ThoughtfulAnswer.where("user_id = ?", id)
	end

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