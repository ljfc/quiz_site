class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Unprivileged users do everything via the response, pretty much, so that they can't accidentally see the answers, or other people's responses and so on.
    can :index, :site
    can [:new, :create], Response # To allow pre-sign-up quiz answering.
    can [:new, :create], :session # To allow log in.
    can [:new, :create], User # To allow sign up.

    if !user.new_record? && user.regular? # Normal logged-in user.
      # Currently there isn't actually anything else for them to do beyond a logged out user.
    elsif user.admin? # Straight-up superuser, nothing is forbidden.
      can :manage, :all
    elsif user.editor? # Will need to create/update quizzes and related models.
      can :manage, Quiz
      can :manage, Question
      can :manage, PossibleAnswer
    end

  end
end
