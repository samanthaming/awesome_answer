class User < ActiveRecord::Base
  has_secure_password
  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :like

  has_many :favorites, dependent: :destroy
  has_many :favorite_questions, through: :favorites, source: :favorite

  has_many :votes, dependent: :destroy
  has_many :voted_question, through: :votes, source: :question

  validates :password, length: {minimum: 6}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

end
