class Response < ActiveRecord::Base
  attr_accessible :answer_id, :why

  belongs_to :user

  belongs_to :answer, class_name: 'PossibleAnswer'
  has_one :question, through: :answer
  has_one :quiz, through: :question

  belongs_to :rejected_by, class_name: 'User'

  attr_accessor :question
end
