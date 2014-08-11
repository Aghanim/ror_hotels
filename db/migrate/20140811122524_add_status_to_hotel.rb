class AddStatusToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :status, :integer
  end
end
