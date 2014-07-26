require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Hotel pages" do

  subject { page }

  describe "hotel index page" do
    before do 
      visit hotels_path
    end

    it { should have_selector('h3', text: 'List of hotels') }
    it { should have_content('Id') }
    it { should have_content('Title') }
    it { should have_content('Price') }
  end

  describe "hotel new page" do

    before do
      user = create(:user)
      login_as(user, :scope => :user)
      visit new_hotel_path
    end
    it { should have_content('Add a new hotel') }
    it { should have_content('Title') }
    it { should have_content('Price for room') }
    it { should have_content('Star rating') }
    it { should have_content('Description') }
    it { should have_content('Image') }
    it { should have_content('Country') }
    it { should have_content('City') }
    it { should have_content('Street') }
    it { should have_content('State') }

  end
 
end