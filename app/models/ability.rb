class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    can :manage, Question do |question|
      question.user == user
    end
    
    can :destroy, Answer do |answer|
      answer.question.user == user
    end

    can :manage, Answer do |answer|
      answer.user == user
    end

  end
end
