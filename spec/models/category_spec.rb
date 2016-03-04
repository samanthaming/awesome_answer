require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:category)).to be_valid
  end
end
