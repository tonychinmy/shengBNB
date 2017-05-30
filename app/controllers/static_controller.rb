class StaticController < ApplicationController
	def homepage
		@listing = Listing.all.order("created_at DESC")
	end

	
end
