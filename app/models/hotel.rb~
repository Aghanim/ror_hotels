
class Hotel < ActiveRecord::Base
  
mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :title, :country, :state, :country,  :city, :street, length:{ maximum: 255,too_long: 
            "%{count} characters is the maximum allowed" }
  validates :title, :star_rating, presence:{ message: "field should not be empty" } 
  validates :price, :star_rating, numericality: true 
  validates :star_rating, inclusion: { in: 1..5, message: "%{value} is not a valid vote" } 
  validates :description, length: { maximum: 1000, too_long: "%{count} characters 
            is the maximum allowed" }

def pos
    @pos = 1
end

def neg
	@neg = 0
end
  
def bkf_inc
    self.breakfast_in == 1? @bkf_inc = "yes" : @bkf_inc = "no"
end

def rate
    rate = self.votes.sum('mark')
end




end
