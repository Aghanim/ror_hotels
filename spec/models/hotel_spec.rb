require 'spec_helper'


RSpec.describe Hotel  do
  
  it "test for test" do

  hot = create(:hotel, {title: "tit"})


  expect(hot.title).to eq("tit")	
end
	
end