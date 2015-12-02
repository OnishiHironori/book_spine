class BookSpine < ActiveRecord::Base
	include ApplicationModel

	belong_to :user, foreign_key: :user_id
	belong_to :book, foreign_key: :book_id

	validates :user_id, presence: true
	validates :book_id, uniqueness: {scope: :user_id}, presence: true
end
