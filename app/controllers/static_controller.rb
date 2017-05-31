class StaticController < ApplicationController
	def homepage
		@listing = Listing.all.order("created_at DESC").page(params[:page])
	end

	
end
