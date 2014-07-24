class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to hotel_path(@hotel)
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.find(params[:id])
    @comment.destroy
    redirect_to hotel_path(@hotel)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
