class Helperclass

def top(size)
  
    top =Array.new()
  
  	temp = Vote.select("hotel_id as id, sum(mark) as sum").group("hotel_id").order("sum desc").limit(size)
  	temp.each do |i|
    	top << Hotel.find(i.id)
    end

    return top
end



end
