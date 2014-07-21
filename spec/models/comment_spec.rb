require 'spec_helper'


RSpec.describe Comment  do

  it "test of noname return if autor undefined" do

  comment = create(:comment,{ user_id: 0 })

  expect(comment.autor).to eq("no name")

  end
	
end