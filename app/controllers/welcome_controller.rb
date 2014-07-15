class WelcomeController < ApplicationController
  def index
  #переделать
    size = 5 #лимит
    @top =Array.new()
    n=0
  	temp = Vote.select("hotel_id as id, sum(mark) as sum").group("hotel_id").order("sum desc").limit(size)
  	temp.each do |i|
  	 @top[n] = Hotel.find(i.id)
     n=n+1
    end
  end
end
