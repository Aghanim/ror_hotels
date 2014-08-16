class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :hotels
  has_many :votes #окончание имеет значение!	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  Admin = "admin"
  Common = "user"
  Is_admin = 1

  def self.is_admin?(role)
    if role == Is_admin then return true
    else 
      return false
    end
  end

  def getrole
    self.role == 1? @getrole = Admin : @getrole = Common
  end

  def self.search(search,field)
  if search
    where("#{field} LIKE ?", "%#{search}%")
  else
    all
  end
end
  
end
