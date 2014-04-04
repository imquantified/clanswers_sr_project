class Answer < ActiveRecord::Base
	belongs_to :question
	# just store user_id without "belonging to it"
	belongs_to :user

	validates :user_id, presence: true
	validates :question_id, presence: true
	# Character limit = ?
	# validates :content, presence: true, length: { minmum: 1, maximum: 280 }
end