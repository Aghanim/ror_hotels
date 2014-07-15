class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel

  def autor
  
  temp = User.find(self.user_id)
  temp ? @autor = temp.email : @autor = 'no name'
 
  end

end
