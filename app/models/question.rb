class Question < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, through: :answers
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :like
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :favorite

  # this will fail validations (so it won't create or save) if the title is
  # not provided
  validates :title, presence:   true,
                    uniqueness: { case_sensitive: false },
                    length:     {minimum: 3, maximum: 255}

  # DSL: Domain Specific Language
  # the code we use in here is completely valid Ruby code but the method naming
  # and arguments are specific to ActiveRecord so we call this an ActiveRecord
  # DSL
  validates(:body, {uniqueness: {message: "must be unique!"}})

  # this validates that the combination of the title and body is unique. Which
  # means the title doesn't have to be unique by itself and the body doesn't
  # have to be unique by itself. However, the combination of the two fields
  # must be unique
  # validates :title, uniqueness: {scope: :body}

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  #   validates :email,
  #             format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  # This is using custom validation method. We must make sure that `no_monkey`
  # is a method available for our class. The method can be public or private
  # It's more likely we will have it a private method because we don't need
  # to use it outside this class.
  validate :no_monkey

  paginates_per 12

  after_initialize :set_defaults
  before_save :capitalize_title

  # scope :recent, lambda {|x| order("created_at DESC").limit(x) }
  def self.recent(number = 5)
    order("created_at DESC").limit(number)
  end

  def self.popular
    where("view_count > 10")
  end

  # Wildcard search by title or body
  # ordered by view_count descending
  # def self.search(term)
  #   where(["title ILIKE ? OR body ILIKE ?", "%#{term}%", "%#{term}%"]).order("view_count DESC")
  #   # where(["title ILIKE ? OR body ILIKE ?", "%#{term}%", "%#{term}%"]).recent  ## recent refers to the "def self.recent" method
  # end

  scope :search, -> term {where(["title ILIKE ? OR body ILIKE ?", "%#{term}%", "%#{term}%"]).order("view_count DESC")}

  def category_name
    category.name if category
  end

  def like_for(user)
    likes.find_by_user_id user
  end

  def likes_count
    likes.count if likes.count > 0
  end

  def favorite_for user
    favorites.find_by_user_id user
  end

  def favorites_count
    favorites.count if favorites.count > 0
  end

  private

  def set_defaults
    self.view_count ||= 0
  end

  def capitalize_title
    self.title.capitalize!
  end

  def no_monkey
    if title && title.downcase.include?("monkey")
      errors.add(:title, "No monkey!!")
    end
  end


end


# cord drill and pump drill
