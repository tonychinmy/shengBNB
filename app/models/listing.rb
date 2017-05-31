class Listing < ApplicationRecord
	paginates_per 7
  belongs_to :user
end
