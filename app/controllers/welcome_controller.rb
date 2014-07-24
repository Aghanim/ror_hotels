class WelcomeController < ApplicationController
  def index
    @hotels = Hotel.new
  end
end
