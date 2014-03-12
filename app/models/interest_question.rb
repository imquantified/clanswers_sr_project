class InterestQuestion < ActiveRecord::Base
	belongs_to :user
 	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	# Character limit = 560
	validates :content, presence: true, length: { minimum: 1, maximum: 560 }
end
