require 'spec_helper'


RSpec.describe HotelsController  do
  
  def self.it_render_404_page_when_hotel_is_not_found(*actions)
    actions.each do |a|
      it "#{a} render 404 page_when_hotel_is_not_found" do
        verb = if a == :update
          "PATCH"
        elsif a == :destroy
          "DELETE"
        else
          "GET"
        end
        process a,verb,{ id: 0}
        expect(response).to have_http_status(404)
      end
    end
  end

  it_render_404_page_when_hotel_is_not_found :show#,  :destroy #, :edit, :update,

    describe "show action" do

    it "render show template if hotel is found" do
      hotel = create(:hotel)
      get :show,id: hotel.id
      expect(response).to render_template("show")
    end
    end

  describe "create action" do
    before (:each) do
    # наш пользователь
    @user = create(:user)
    # логинимся под ним
    sign_in @user
  end
  
    it "redirect to show template if hotel is valid" do
      post :create, hotel: {title: "test", star_rating: 5 , price: 100}
      expect(response).to redirect_to(assigns[:hotel])
    end

    it "render new page again if hotel is invalid" do
      post :create, hotel: {title: "test", star_rating: nil , price: 100}
      expect(response).to render_template("new")   
    end

  end

  describe "update action" do

    before (:each) do
    # наш пользователь
      @admin = create(:admin)
    # логинимся под ним
      sign_in @admin
    end
   	
    it "redirect to show template if hotel is valid" do

     uphotel = create(:hotel)
     put :update, { :id => uphotel.id, hotel: {title: "test", star_rating: 5 , price: 100} }
     expect(response).to redirect_to(assigns[:hotel])
    end

    it "should find the article and return the object" do
      uphotel = create(:hotel)
      put :update, { :id => uphotel.id, hotel: {title: "test", star_rating: nil , price: 100} }
      expect(response).to render_template("edit")
    end
  end

  describe "destroy action" do
   
    before (:each) do
    # наш пользователь
      @admin = create(:admin)
    # логинимся под ним
      sign_in @admin
    end

    it "redirect to index template if hotel is found" do
      hotel = create(:hotel)
      delete :destroy,id: hotel.id
      expect(response).to redirect_to(hotels_path)
    end

    it "redirect to index template if hotel is not found" do
      delete :destroy,id: 0
      expect(response).to have_http_status(404)
    end
  end
end
