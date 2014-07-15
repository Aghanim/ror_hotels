class VotesController < ApplicationController
respond_to :html, :json

before_filter :authenticate_user!

def create
	@hotel = Hotel.find(params[:hotel_id])
    @vote = @hotel.votes.new(vote_params)
    @vote.user_id = current_user.id
    if @vote.valid?
         @vote.save
    else
         flash[:alert] = "You can only vote once"
   end
   redirect_to hotel_path(@hotel)
 end

private
  def vote_params
  	params.require(:vote).permit(:mark)
  end

end
