class ListingsController < ApplicationController
	def homepage

	end

	def new
		@listing = Listing.new
	end

	def create
	@listing = Listing.new(listing_params)
	@listing.user = current_user
	# @listing.user_id = current_user.id
	    if @listing.save
	     	 redirect_to root_path
	    else
	      render template: "listings/new"
	    end
	end

	private
	def listing_params
    params.require(:listing).permit(:property_type, :price, :address, :picture)
  end
end
