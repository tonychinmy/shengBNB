class Listing < ApplicationRecord
	paginates_per 7
  belongs_to :user
  has_many :reservations
  mount_uploaders :listing_photos, ListingPhotosUploader
end

