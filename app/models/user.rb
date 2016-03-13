class User < ActiveRecord::Base
  has_secure_password
  has_many :answers, dependent: :nullify
  has_many :questions, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :like

  has_many :favorites, dependent: :destroy
  has_many :favorite_questions, through: :favorites, source: :question

  has_many :votes, dependent: :destroy
  has_many :voted_question, through: :votes, source: :question

  mount_uploader :image, ImageUploader

  validates :password, length: {minimum: 6}, on: :create ## make sure you have this, otherwise require password everytime you update account
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  before_create :generate_api_key

  private

  def generate_api_key
    # self.api_key = SecureRandom.hex(32)
    #
    # while User.exists?(api_key: self.api_key)
    #   self.api_key = SecureRandom.hex(32)
    # end

    # Refactored...
    begin
      self.api_key = SecureRandom.hex(32)
    end while User.exists?(api_key: self.api_key)

  end

end
