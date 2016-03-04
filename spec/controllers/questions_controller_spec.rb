require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, {user: nil}) }
  let(:question_with_owner) {FactoryGirl.create(:question, {user: user})}

  describe "#destroy" do
    before { request.session[:user_id] = user.id }

    context "with user is signed in" do

      context "with user owning the question" do

        it "remove the campaign from the database" do
          question_with_owner
          count_before = Question.count
          delete :destroy, id: question_with_owner.id
          count_after = Question.count
          expect(count_before-count_after).to eq(1)
        end
      end

      context "with user not owning the question" do

      end
    end

  end
end
