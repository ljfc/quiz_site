class Quiz < ActiveRecord::Base
  attr_accessible :owner_id, :featured, :introduction, :name

  belongs_to :owner, class_name: 'User'

  has_many :questions,
    dependent: :restrict,
    order: '`questions`.`order` ASC'
  has_many :possible_answers, through: :questions
  has_many :responses, through: :questions

  def self.featured
    where(featured: true)
  end

  def responses_for_user_or_session(user, session_id)
    return user.responses.for_quiz(self) if user
    return Response.for_session(session_id).for_quiz(self) if session_id
  end


  # Testing completion of the quiz.

  def done?(user, session_id) # Need the session in case they are anonymous.
    (user && done_by_user?(user)) || (session_id && done_during_session?(session_id))
  end

  def done_by_user?(user)
    user && (user.responses.for_quiz(self).count == self.questions.count)
  end

  def done_during_session?(session_id)
    session_id && (Response.for_session(session_id).for_quiz(self).count == self.questions.count)
  end

end
