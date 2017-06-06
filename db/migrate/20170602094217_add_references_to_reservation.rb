class AddReferencesToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reservations, :user, index: true, foreign_key: true
  	add_reference :reservations, :listing, index: true, foreign_key: true
  end
end
