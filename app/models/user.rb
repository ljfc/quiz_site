class User < ActiveRecord::Base
  attr_accessible :email, :display_name

  has_many :identities, inverse_of: :user,
    dependent: :nullify

  validates :email,
    presence: true,
    uniqueness: true

  def regular?
    !admin? && !editor?
  end

  def self.from_identity(identity)
    User.create(email: identity.email, display_name: identity.name)
  end

end
