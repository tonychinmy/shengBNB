class AddListingPhotosToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :listing_photos, :json
  end
end
