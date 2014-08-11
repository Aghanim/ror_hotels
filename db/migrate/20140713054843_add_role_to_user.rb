class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
  end
  
  def migrate(direction)
    super
    # Create a default admin
    User.create!(email: 'admin@demo.com', password: 'demopass', password_confirmation: 'demopass',role: '1') if direction == :up
  end  
end
