class Book < ActiveRecord::Base
	include ApplicationModel

	belongs_to :publisher, foreign_key: :publisher_id
	has_many   :book_spines

	validates :publisher_id, presence: true
	validates :has_licensing, inclusion: { in: [0, 1] }, presence: true
	validates :isbn, length: { is: 13 }, numeric_literality: true, uniqueness: {scope: :nbn}, presence: true
	validates :nbn, length: { is: 10 }, presence: true
	validates :size_mm_x, numericality: true
	validates :size_mm_y, numericality: true

	after_initialize :set_default

	def set_default
		self.isbn          ||= '0000000000000'
		self.nbn           ||= 'JP00000000'
	end
end
