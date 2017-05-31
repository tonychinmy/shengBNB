class AddDescriptionToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :description, :text
  end
end
