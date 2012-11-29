class Response < ActiveRecord::Base
  attr_accessible :answer_id, :why

  belongs_to :user

  belongs_to :answer, inverse_of: :responses,
    class_name: 'PossibleAnswer'
  has_one :question, through: :answer
  has_one :quiz, through: :question

  belongs_to :rejected_by, class_name: 'User'


  def self.for_session(session_id)
    where(session_id: session_id)
  end

  def self.for_quiz(quiz)
    joins(:question).where(questions: { quiz_id: quiz.id })
  end

end
