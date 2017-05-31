class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]

	def homepage
		
	end

	def index
		@listings = current_user.listings.order("created_at DESC").page(params[:page])
	end

	def new
		@listing = Listing.new
	end

	def create
	@listing = current_user.listings.new(listing_params)
	# @listing.user = current_user
	# @listing.user_id = current_user.id
	    if @listing.save
	     	 redirect_to listings_path
	    else
	      render template: "listings/new"
	    end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listings_path
	end

	def destroy
		@listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
	end

	private
	def set_listing
		@listing = Listing.find(params[:id])
	end

	def check_owner
    unless @listing.user_id == current_user.id
      redirect_to listings_path, notice: "You are not allowed to access that page."
    end
  end

	def listing_params
    params.require(:listing).permit(:property_type, :price, :address, :picture, :title, :decription)
  end
end
