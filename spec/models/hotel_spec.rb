require 'spec_helper'

RSpec.describe Hotel  do

  before { @hotel = create(:hotel)}
  
  it "test of 'yes' and 'no' decode" do

    expect( @hotel.bkf_inc).to eq("yes")

  end

  it "rate calculating test" do
  
    vote1=create(:vote1)
    vote2=create(:vote2)
    vote3=create(:vote3)

    @hotel.votes << vote1
    @hotel.votes << vote2
    @hotel.votes << vote3

    expect( @hotel.rate).to eq(15)	
  end
end