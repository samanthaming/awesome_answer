json.array! @questions do |question|
  json.id               question.id
  json.title            question.title.titleize
  json.creation_date    question.created_at.strftime("%Y-%b-%d")
  json.answer_count     question.answers.count
  json.category         question.category_name
  json.author           user_full_name(question)
end
