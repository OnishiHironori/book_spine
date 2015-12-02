class UserAccount < ActiveRecord::Base
	include ApplicationModel

	belongs_to :user, foreign_key: :user_id

	validates :user_id, uniqueness: true, presence: true
	validates :mail_address, length: { maximum: 254 }, email: true, presence: true
	validates :password_digest, length: { is: 60 }, presence: true
end
