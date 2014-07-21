class RemovePhotoFromHotels < ActiveRecord::Migration
  def change
    remove_column :hotels, :photo, :string
  end
end
