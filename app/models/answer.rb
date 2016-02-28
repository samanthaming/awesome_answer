class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments, dependent: :destroy

  validates :body, presence: true
end
