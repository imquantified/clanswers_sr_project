class InterestAnswer < ActiveRecord::Base
	belongs_to :interest_question
	belongs_to :user

	validates :user_id, presence: true
	validates :interest_question_id, presence: true
	# Character limit = 560
	validates :content, presence: true, length: { minmum: 1, maximum: 560 }
end
