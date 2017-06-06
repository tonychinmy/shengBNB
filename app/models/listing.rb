class Listing < ApplicationRecord
	
  belongs_to :user
  has_many :reservations


  paginates_per 7
  mount_uploaders :listing_photos, ListingPhotosUploader



end

