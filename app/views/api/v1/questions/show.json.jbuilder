json.question do
  json.title          @question.title
  json.content        @question.body
  json.creation_date  @question.created_at.strftime("%Y-%b-%d")
  json.answer_count   @question.answers.count
  json.category       @question.category_name
  json.author         user_full_name(@question)

  json.answers        @question.answers do |answer|
                        json.body  answer.body
                      end
end
