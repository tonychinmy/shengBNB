class RemovePictureFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :picture, :string
  end
end
