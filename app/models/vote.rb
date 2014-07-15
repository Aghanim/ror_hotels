class Vote < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  

  validates :user_id, uniqueness: { scope: :hotel_id,
    message: "You can only vote once" }

  validates :mark, presence:{ message: "field should not be empty" } 
  validates :mark, numericality: true 
  validates :mark, inclusion: { in: 1..5, message: "%{value} is not a valid mark" }
end
