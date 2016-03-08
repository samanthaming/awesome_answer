class AnswersMailer < ApplicationMailer

  def notify_question_owner(answer)
    @answer = answer
    @question = answer.question
    @owner = answer.user
    mail(to: @owner.email, subject: "You got an answer!")
  end

end
