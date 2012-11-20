class PossibleAnswer < ActiveRecord::Base
  attr_accessible :correct, :text

  belongs_to :question
  has_one :quiz, through: :question

  has_many :responses,
    dependent: :restrict
  has_many :users, through: :responses

end
