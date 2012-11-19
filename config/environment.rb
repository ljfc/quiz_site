# Load the rails application.
require File.expand_path('../application', __FILE__)

# Additional application-wide configuration.
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

# Initialize the rails application.
QuizSite::Application.initialize!
