class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :hotel, index: true
      t.integer :mark

      t.timestamps
    end
  end
end
