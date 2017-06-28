source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'mysql2', '~> 0.3.18'
end

group :test do
  gem 'pg'
end

gem 'high_voltage'
gem 'slim-rails'
gem 'modernizr-rails'
gem 'meta-tags', require: 'meta_tags'
gem 'responders', '~> 2.0'
gem 'bh'
gem 'simple_form'
gem 'gibbon'
gem 'premailer-rails'
gem 'nokogiri'
gem 'devise', '~> 4.2'
gem 'omniauth'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-google-oauth2'
gem 'google-api-client', '0.8.2', require: 'google/api_client'
gem 'omniauth-facebook'

gem 'rack-mini-profiler'

group :development do
  # gem 'better_errors', git: 'git@github.com:charliesome/better_errors.git'
  gem 'binding_of_caller'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'rails_layout'
  # gem 'spring-commands-rspec'
  gem 'awesome_print'
  gem 'annotate'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'dotenv-rails'
  # gem 'jazz_hands2', git: 'git@github.com:shaicoleman/jazz_hands2.git'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end

gem 'bootstrap-social-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'cocoon'
gem 'geocoder'
gem 'decanter'

# used for locations on venue form
gem 'jquery-ui-rails' # used for autocomplete
gem 'rails-jquery-autocomplete' # used for autocomplete

# used for avatars/photos
gem 'jasny-bootstrap-rails'
gem 'carrierwave'
gem 'simple_form_jasny_fileupload'
gem 'cloudinary'

# used for pagination
gem 'kaminari', :git => "git://github.com/amatsuda/kaminari.git", :branch => 'master'
# used for real-time exception reporting
# gem 'sentry-raven'
# used for virtual attributes
gem 'virtus'
