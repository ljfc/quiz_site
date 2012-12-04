source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'
gem 'thin'

group :development do
  gem 'debugger'
  gem 'capistrano'
  gem 'quiet_assets'
end

group :test do
  gem 'debugger'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'mocha', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3' # A different version is specified by ActiveAdmin.
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Authentication
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'omniauth-facebook'
gem 'omniauth-identity' # For password-based login.
# Authorisation
gem 'cancan'

# Administration
gem 'activeadmin'
# Required for ActiveAdmin where Rails >= 3.1
gem 'sass-rails'
gem 'meta_search', '>= 1.1.0.pre'

# Console improvements
gem 'awesome_print'
gem 'hirb'
gem 'wirble'
