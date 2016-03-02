class Comment < ActiveRecord::Base
  belongs_to :answer

  # This makes it a class method
  # So we can call it in views like this: Comment.for_answer(..)
  # def self.for_answer (answer_id)
  #   where({answer_id: answer_id})
  # end
  # Alternatively, do it as a scope:
  scope :for_answer, -> answer_id { where(answer_id: answer_id).order("created_at DESC") }

end
