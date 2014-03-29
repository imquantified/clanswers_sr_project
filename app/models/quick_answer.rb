class QuickAnswer < ActiveRecord::Base
	belongs_to :quick_question
	belongs_to :user

	validates :user_id, presence: true
	validates :quick_question_id, presence: true
	# Character limit = 280
	validates :content, presence: true, length: { minmum: 1, maximum: 280 }
end
