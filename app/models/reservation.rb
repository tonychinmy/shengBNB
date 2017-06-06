class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	paginates_per 7

	before_save :calculate_price

	def calculate_price
		self.price = (self.end_date - self.start_date) * self.listing.price
	end
end
