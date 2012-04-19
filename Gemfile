source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'paper_trail'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'twitter-text'
gem 'whenever', :require => false

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'bourbon'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'friendly_id'
gem 'rmagick'
# gem 'mini_magick'
gem 'carrierwave'

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'log_buddy'
  gem "rspec-rails"
  gem 'sqlite3'
end

group :test do
  gem "capybara"
  gem "guard-rspec"
  gem "launchy"
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'delorean'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
