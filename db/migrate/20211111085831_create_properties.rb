class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string  :title
      t.string  :address
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.string  :photo
      t.references :account
      
      t.timestamps
    end
  end
end
