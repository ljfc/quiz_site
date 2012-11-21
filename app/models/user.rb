class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :email,
    uniqueness: true

  def regular?
    !self.admin? && !self.editor?
  end

end
