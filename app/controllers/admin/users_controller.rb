module Admin
class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_logged_in!
  helper_method :sort_column, :sort_direction


# метод показать все записи
  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

# метод редактировать
  def edit
    @user = User.find(params[:id])
  end
  # метод обновить
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

# метод удалить  
  def destroy
    unless @user= User.where(id: params[:id]).first
      render text: "Page not found", status: 404
    else
      @user.destroy
      redirect_to admin_users_path
    end
end

  private
    def check_admin_logged_in! # admin must be logged in
      if user_signed_in? then
        unless User.is_admin?(current_user.role) then redirect_to root_path end
      end
    end
  
    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def user_params
      params.require(:user).permit(:email, :role)
    end
end

end
