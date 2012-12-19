class Question < ActiveRecord::Base
  attr_accessible :text, :more_info

  belongs_to :quiz, inverse_of: :questions

  has_many :possible_answers, inverse_of: :question

  has_many :responses, through: :possible_answers,
    dependent: :restrict

  validates :order,
    presence: true

  before_validation :add_ordering

  after_create :create_default_answers


  def next_question
    self.quiz.questions.find_by_order(self.order + 1)
  end

  def correct_answer
    self.possible_answers.where(correct: true).first
  end

protected

  def add_ordering
    if self.order == 0 && self.quiz.questions.any?
      self.order = self.quiz.questions.maximum('order') + 1
    elsif self.order == 0 && self.quiz.questions.empty?
      self.order = 1
    end
  end

  def create_default_answers
    self.possible_answers.create(text: 'Positive impact')
    self.possible_answers.create(text: 'Negative impact')
    self.possible_answers.create(text: 'No impact')
  end

end
