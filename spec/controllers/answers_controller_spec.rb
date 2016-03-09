require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question)}
  let(:answer) { FactoryGirl.create(:answer) }
  let(:answer_with_owner) {FactoryGirl.create(:answer, {user: user})}

  describe "#destroy" do

    context "with user is signed in" do

      before { request.session[:user_id] = user.id }

      context "with user owning the question" do

        it "remove the campaign from the database" do
          answer_with_owner
          question_id = answer_with_owner.question.id
          # question_id = question.id
          count_before = Answer.count
          delete :destroy, question_id: question_id, id: answer_with_owner.id
          count_after = Answer.count
          expect(count_before-count_after).to eq(1)
        end
      end

      context "with user not owning the question" do

        it "doesn't remove the campaign from the database" do
          answer
          count_before = Answer.count
          delete :destroy, question_id: question.id, id: answer.id
          count_after = Answer.count
          expect(count_after-count_before).to eq(0)
        end
      end
    end

  end


end
