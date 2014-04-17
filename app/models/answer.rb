class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :user_id, presence: true
	validates :question_id, presence: true
	# Character limit = 2240
	validates :content, presence: true, length: { minmum: 1, maximum: 2240 }
end