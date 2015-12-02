class User < ActiveRecord::Base
	include ApplicationModel

	has_one :user_account

	validates :user_id, presence: true
	validates :name, length: { in: 1..63 }, uniqueness: true, presence: true
end
