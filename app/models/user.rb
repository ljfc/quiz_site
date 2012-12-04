class User < ActiveRecord::Base
  attr_accessible :email, :display_name

  has_many :identities, inverse_of: :user,
    dependent: :nullify
  has_many :quizzes, inverse_of: :owner,
    dependent: :nullify,
    foreign_key: :owner_id
  has_many :questions, through: :quizzes
  has_many :possible_answers, through: :questions
  has_many :responses, inverse_of: :user,
    dependent: :nullify
  has_many :answers, through: :responses,
    class_name: 'PossibleAnswer'

  validates :email,
    presence: true,
    uniqueness: true

  validates :display_name,
    presence: true

  def regular?
    !admin? && !editor?
  end

  def self.from_identity(identity)
    User.create(email: identity.email, display_name: identity.name)
  end

  def take_over_session(session_id)
    responses = Response.for_session(session_id)
    responses.each do |response|
      response.user = self
      logger.error "User#take_over_session: Could not save response with ID #{response.id}" unless response.save
    end
  end

end
