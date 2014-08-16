module Admin
class HotelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_logged_in!
  helper_method :sort_column, :sort_direction

# метод показать все записи
  def index
    @hotels = Hotel.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

# метод редактировать
  def edit
    @hotel = Hotel.find(params[:id])
    if @hotel.status != 1 then
      render text: "You can't change this status"
    end
  end
  # метод обновить применяется только для обновления статуса и отправки уведомления
  def update
    @hotel = Hotel.find(params[:id])
      if @hotel.update(hotel_params)

        UserMailer.status_changed(User.find(@hotel.user_id),@hotel).deliver
        redirect_to admin_hotels_path
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
      redirect_to admin_hotels_path
    end
  end

  private
    def check_admin_logged_in! # admin must be logged in
      if user_signed_in? then
        unless User.is_admin?(current_user.role) then redirect_to root_path end
      end
    end
  
    def sort_column
      Hotel.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def hotel_params
      params.require(:hotel).permit(:status)
    end
  end

end
