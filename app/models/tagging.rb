class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :question

  # we want to have both question and tag id
  # validates :tag_id, :question_id, presence: true

  # we don't want the same question to have duplicate tags
  validates :tag_id, uniqueness: { scope: :question_id }

end
