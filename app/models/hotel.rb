class Hotel < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :title, :country, :state, :country,  :city, :street, length:{ maximum: 255,too_long: "%{count} characters is the maximum allowed" }
  validates :title, :star_rating, presence:{ message: "field should not be empty" } 
  validates :price, :star_rating, numericality: true 
  validates :star_rating, inclusion: { in: 1..5, message: "%{value} is not a valid vote" } 
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  #===========================
  #1 - да, 0 - нет
  #status:
  # 1-pending
  # 2-approved
  # 3-rejected
  #===========================

  def status_decode
    if self.status == 1 then return'pending'
    elsif self.status == 2 then return'approved'
    elsif self.status == 3 then return 'rejected'
    else return 'indefinitely'
    end
  end

  def self.search(search)
    if search
      where("status = #{search}")
    else
      all
    end
  end

  def top(size)
    temp = Hotel.select("hotels.*, COUNT(votes.id) AS rating").where("status = 2").joins("LEFT JOIN votes ON votes.hotel_id = hotels.id").group("hotels.id").order("rating desc").limit(size)
    return temp
  end


end
