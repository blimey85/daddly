# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

### Servers
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2'
gem 'redis'
gem 'sidekiq'

# Authentication and Authorization
gem 'devise', '~> 4.2' # TODO: current version is 4.4.3+... can we safely upgrade?
gem 'google-api-client', '0.8.2', require: 'google/api_client'
gem 'koala'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-twitter'

# Frontend Stuff
gem 'bootstrap-social-rails'
gem 'cloudinary'
gem 'cocoon'
gem 'jquery-rails'
gem 'jquery-ui-rails' # used for autocomplete
gem 'rails-jquery-autocomplete' # used for autocomplete
gem 'simple_form'
gem 'slim-rails'
gem 'sweet-alert2-rails'

# Uploads
gem 'carrierwave'
gem 'jasny-bootstrap-rails'
gem 'simple_form_jasny_fileupload'

# Utilities
gem 'active_enum', github: 'adzap/active_enum'
gem 'active_model_serializers', '~> 0.10.0'
gem 'activerecord-import'
gem 'bootsnap', require: false
gem 'coffee-rails', '~> 4.2'
gem 'counter_culture', '~> 1.0'
gem 'decanter'
gem 'geocoder'
gem 'gibbon'
gem 'goldiloader'
gem 'high_voltage'
gem 'kaminari', github: 'amatsuda/kaminari', branch: 'master'
gem 'mailboxer', github: 'mailboxer/mailboxer'
gem 'marginalia'
gem 'meta-tags', require: 'meta_tags'
gem 'modernizr-rails'
gem 'nokogiri'
gem 'premailer-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'responders', '~> 2.0'
gem 'sass-rails', '~> 5.0'
gem 'searchkick'
gem 'sendgrid-actionmailer'
gem 'simple_discussion'
gem 'timber', '~> 2.1'
gem 'uglifier', '>= 1.3.0'
gem 'virtus'

group :development do
  gem 'annotate', github: 'ctran/annotate_models'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'guard-livereload', require: false
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'irbtools-more', require: 'irbtools/binding'
  gem 'launchy'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices'
  gem 'seed_dump'
  gem 'spring-commands-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'capybara', '~> 3.1'
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker', github: 'stympy/faker'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'master'
  gem 'simplecov', '~> 0.14', require: false
  gem 'simplecov-console', require: false
  gem 'test-prof'
end

group :production do
  gem 'sentry-raven'
  gem 'skylight'
end
