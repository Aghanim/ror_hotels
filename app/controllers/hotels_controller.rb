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
    unless @hotel= Hotel.where(id: params[:id]).first
      render text: "Page not found", status: 404
    end
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
    unless @hotel= Hotel.where(id: params[:id]).first
      render text: "Page not found", status: 404
    else
      @hotel.destroy
      redirect_to hotels_path
    end
end

  private
    def check_admin_logged_in! # admin must be logged in
      if user_signed_in? then
        if current_user.role != 1 then redirect_to root_path end
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
