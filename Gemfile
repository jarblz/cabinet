source 'https://rubygems.org'
ruby '2.3.1'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass', '~> 3.3.7'
gem 'sass-rails', '>= 3.2'
gem 'high_voltage'
gem 'dotenv'
gem 'friendly_id'
# profile/company image processing
gem "paperclip", "~> 5.0.0"
gem "aws-sdk"

# authentication/authorization
gem 'devise'
gem 'rolify'
# administration
# gem "administrate" # not customizeable enough

gem 'semantic-ui-sass'

gem 'httparty'

gem 'geocoder'
# other gems I should be using
# Kaminari - pagination
# Ransack - pagination, searching/filtering
# paperclip/carrierwave
# Searchkick - natural language searching
# Metamagic - SEO
# Rubocop - static code smeller
# Brakeman - static code security/vulnerability analysis

group :development do
  gem 'binding_of_caller'
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'letter_opener'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem "factory_bot_rails"
  gem 'faker'
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :production do
  gem 'sendgrid-ruby'
end
