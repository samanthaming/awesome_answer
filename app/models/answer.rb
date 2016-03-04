class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :body, presence: true

  paginates_per 5

  # This makes it a class method
  # So we can call it in views like this: Answer.for_question(..)
  # def self.for_question (question_id)
  #   where({question_id: question_id})
  # end
  # Alternatively, do it as a scope:
  scope :for_question, -> question_id{ where({question_id: question_id}) }


end
