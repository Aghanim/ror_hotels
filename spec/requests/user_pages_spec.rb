require 'spec_helper'

describe "User pages" do

  subject { page }

  shared_examples_for "all user pages" do
    it { should have_selector('h2', text: heading) }
    
  end

  describe "signup page" do
    before { visit new_user_registration_path }

    it_should_behave_like "all user pages" do

      let(:heading) { 'Sign up' }
    
    end

    it { should have_content('Email') }
    it { should have_content('Password') }
    it { should have_content('Password confirmation') }
  end

    describe "signin page" do
    before { visit new_user_session_path }

    it_should_behave_like "all user pages" do

      let(:heading) { 'Sign in' }
  
    end

    it { should have_content('Email') }
    it { should have_content('Password') }
    
  end

end