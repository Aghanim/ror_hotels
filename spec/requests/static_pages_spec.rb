require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text:'Top 5 hotels') }
    it { should have_title('Hotels') }
    

    it "should have the right links on navbar" do
        
      click_link "Home"
      expect(page).to have_http_status(:success)
      expect(page).to have_selector('h1', text:'Top 5 hotels')
      click_link "Hotels"
      expect(page).to have_http_status(:success)
      expect(page).to have_selector('h3', text:'List of hotels')
      click_link "Add a hotel"
      expect(page).to have_http_status(:success)
      #неавторизированные пользователи не допускаются
      expect(page).to have_selector('h2', text:'Sign in')
    end

 end
  


end