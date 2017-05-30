class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :type
      t.integer :price
      t.string :address
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
