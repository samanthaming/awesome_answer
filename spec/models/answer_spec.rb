require 'rails_helper'

RSpec.describe Answer, type: :model do

  describe "FactoryGirl" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:answer)).to be_valid
    end
  end
end
