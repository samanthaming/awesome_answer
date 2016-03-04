require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end
end
