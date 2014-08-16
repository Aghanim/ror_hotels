class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel

  def autor
    unless temp = User.where(id: self.user_id).first
      @autor = 'no name'
    else
      @autor = temp.email
    end
  end
  
end
