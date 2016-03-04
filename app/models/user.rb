class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :like

  validates :password, length: {minimum: 6}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

end
