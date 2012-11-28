OmniAuth.config.logger = Rails.logger # Otherwise it goes to stdout.

Rails.application.config.middleware.use OmniAuth::Builder do
  # Used only for development and testing.
  unless Rails.env.production?
    provider :developer,
      fields: [:email, :full_name, :display_name],
      uid_field: :email
  end

  # Facebook App is called 80,000 hours quiz site, or eightykhr_quiz.
  # https://developers.facebook.com/apps/302217659889120
  provider :facebook,
    '302217659889120',
    'e078a45f3dc1161d26e307c8b012171d',
    scope: 'email', # Don't need more because the Feed Dialog does not need additional permissions.
    width: '48',
    height: '48'

  # 'Identity' strategy is a vanilla email/password login.
  provider :identity,
    fields: [:name, :unique_identifier],
    on_failed_registration: lambda { |env| IdentitiesController.action(:new).call(env) } # Call through a lambda so that changes in the #new action are picked up in development mode immediately.

  # If it is straightforward, it would probably be good to add Twitter here, and maybe some others.

end
