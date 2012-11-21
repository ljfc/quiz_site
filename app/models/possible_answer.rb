class PossibleAnswer < ActiveRecord::Base
  attr_accessible :correct, :text

  belongs_to :question
  has_one :quiz, through: :question

  has_many :responses,
    inverse_of: :answer,
    foreign_key: :answer_id,
    dependent: :restrict
  has_many :users, through: :responses

end
