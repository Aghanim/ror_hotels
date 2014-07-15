class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.references :user, index: true
      t.string :title
      t.integer :star_rating
      t.integer :breakfast_in
      t.text :description
      t.string :photo
      t.float :price
      t.string :country
      t.string :state
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
