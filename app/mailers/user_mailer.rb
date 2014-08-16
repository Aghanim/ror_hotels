class UserMailer < ActionMailer::Base
  default from: "admin@demo.com"

  def status_changed(user,hotel)
  	@user = user
  	@hotel = hotel
    mail(to: @user.email, subject: 'Hotel status')
  end	
end
