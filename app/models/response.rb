class Response < ActiveRecord::Base
  attr_accessible :answer_id, :why


# Associations

  belongs_to :user

  belongs_to :answer, inverse_of: :responses,
    class_name: 'PossibleAnswer'
  has_one :question, through: :answer
  has_one :quiz, through: :question

  belongs_to :rejected_by, class_name: 'User'


# Validation

  validates :answer,
    presence: true

  validate :user_or_session_id_present
  

# Callbacks

  # NONE


# Scopes

  def self.for_session(session_id)
    where(session_id: session_id)
  end

  def self.for_quiz(quiz)
    joins(:question).where(questions: { quiz_id: quiz.id })
  end


protected


# Validation

  def user_or_session_id_present
    self.errors.add(:base, 'must be from either a user or a session') if self.user.blank? && self.session_id.blank?
  end


# Callbacks


end
