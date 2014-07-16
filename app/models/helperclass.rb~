class Helperclass

def top(size)
  
    #size = 5 #лимит
    top =Array.new()
   # n=0
  	temp = Vote.select("hotel_id as id, sum(mark) as sum").group("hotel_id").order("sum desc").limit(size)
  	temp.each do |i|
    	top << Hotel.find(i.id)
    end

    return top
end



end