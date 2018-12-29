source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'puma_worker_killer'
gem 'rails', '~> 5.2.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'nokogiri'

gem 'responders'

# Run all
gem 'foreman'

gem 'bootstrap', '~> 4.1', '>= 4.1.1'
gem 'font-awesome-sass', '~> 5.0', '>= 5.0.13'
gem 'pagy'
gem 'sass-rails', '~> 5.0.7'
gem 'slim-rails', '~> 3.2'

# backGround Services
gem 'redis', '~> 4.0'
gem 'sidekiq'

gem 'rest-client'

gem 'storext', '~> 2.2.2'
gem 'services'
gem 'interactor-rails', '~> 2.2.0'

# Backend
gem 'active_model_serializers', '~> 0.10.8'
gem 'quick_random_records'

# Authentication
gem 'devise'
gem 'pundit'

gem 'kaminari', '~>1.1.1'

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.8.0', require: false
  gem 'faker'
  gem 'ffaker'

  # Debbuging Code
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'bullet'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop-rails_config', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubycritic', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 2.15', '< 4.0'
  # gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'

  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %I(mingw mswin x64_mingw jruby)
