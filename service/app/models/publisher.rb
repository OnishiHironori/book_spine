class Publisher < ActiveRecord::Base
	include ApplicationModel

	has_many  :books
	validates :name, length: { in: 1..63 }, presence: true
	validates :code, numeric_literality: true, uniqueness: true, presence: true
	validates :has_licensing, inclusion: { in: [0, 1] }, presence: true
end
