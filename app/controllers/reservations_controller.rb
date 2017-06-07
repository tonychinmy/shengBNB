class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show, :edit, :update, :destroy]
	before_action :check_owner, only: [:edit, :update, :destroy]


	def index
		@listing = Listing.find(params[:listing_id])
		@reservations = @listing.reservations

	end

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing_id = params[:listing_id]
	# @reservation.user = current_user
	# @reservation.user_id = current_user.id
	    if @reservation.save
	    		ReservationMailer.booking_email(current_user, @reservation.user, @reservation.id).deliver_now
	     	 redirect_to listing_reservations_path
	    else
	      render template: "reservations/new"
	    end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update(reservation_params)
    redirect_to reservations_path(@reservation.listing_id)
	end

	def destroy
		@reservation = Reservation.find(params[:id])
    @reservation.destroy
		redirect_to reservations_path
	end

	private
	def set_reservation
		@reservation = Reservation.find(params[:id])
	end

	def check_owner
    unless @reservation.user_id == current_user.id
      redirect_to root_path, notice: "You are not allowed to access that page."
    end
  end

	def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price)
  end
end
