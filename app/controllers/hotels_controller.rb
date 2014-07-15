class HotelsController < ApplicationController
before_filter :authenticate_user!, :except => [:show, :index]
before_filter :check_admin_logged_in!, :except => [:show, :index,:new, :create]
helper_method :sort_column, :sort_direction

 # метод 
 def new

    @hotel = Hotel.new
  
 end



#метод создать запись
 def create
  @hotel = Hotel.new(hotel_params)


  	if @hotel.save
    	redirect_to @hotel
    else
    	render 'new'
    end

end

# метод показать запись по id
def show
  @hotel = Hotel.find(params[:id])
end


# метод показать все записи
def index
	@hotels = Hotel.order(sort_column + " " + sort_direction)
end

# метод редактировать
def edit
	@hotel = Hotel.find(params[:id])
end
# метод обновить
def update
	@hotel = Hotel.find(params[:id])
	if @hotel.update(hotel_params)
		redirect_to @hotel
    else
    	render 'edit'
    end
end

# метод удалить
def destroy
  @hotel = Hotel.find(params[:id])
  @hotel.destroy
 
  redirect_to hotels_path
end



  private
  def check_admin_logged_in! # admin must be logged in
      
        if user_signed_in? then
          if current_user.role != 1 then redirect_to welcome_index_path end
        end
  end
  
  def sort_column
    Hotel.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def hotel_params
    params.require(:hotel).permit(:title, :description, :star_rating, 
    	:breakfast_in, :price, :country, :state, :street,:image, :city)
  end
end
