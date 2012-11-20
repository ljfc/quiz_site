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

end
