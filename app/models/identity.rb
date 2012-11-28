class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :name, :email, :password, :password_confirmation

  auth_key :unique_identifier

  belongs_to :user, inverse_of: :identities

  validates_associated_attributes :user
  validates :user_id,
    uniqueness: { scope: :provider }

  serialize :auth

  def self.from_omniauth(auth)
    if auth[:provider] == 'identity' # UID will simply be the row ID.
      new_identity = find(auth[:uid])
      new_identity.provider ||= auth[:provider] # Not set by the identity strategy.
      new_identity.unique_identifier ||= auth[:info][:email]
    else # UID will vary based on the provider.
      new_identity ||= find_or_initialize_by_provider_and_unique_identifier auth[:provider], auth[:uid]
    end
    new_identity.auth = auth
    new_identity.user ||= User.from_identity(new_identity)
    return new_identity
  end

  # These values are stored virtually, because they appear in different ways from one provider to another.
  # In general, they either appear in the 'auth' hash of information returned from the third party, or in the parameters provided by the 'Identity' strategy.
  def name
    auth[:info][:name] rescue nil
  end
  def name=(name)
    self.auth ||= {}
    self.auth[:info] ||= {}
    self.auth[:info][:name] = name
  end

  def email
    auth[:info][:email] rescue nil
  end
  def email=(email)
    self.auth ||= {}
    self.auth[:info] ||= {}
    self.auth[:info][:email] = email
  end


protected

end
