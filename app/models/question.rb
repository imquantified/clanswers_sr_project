class Question < ActiveRecord::Base

	has_many :answers, dependent: :destroy
	belongs_to :user
	
 	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	# Character limit = 280
	# validates :content, presence: true, length: { minimum: 1, maximum: 280 }
end
