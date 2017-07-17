source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'guard-rspec', '~> 4.6.4', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'mysql2', '~> 0.3.18'
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

# gem 'rack-mini-profiler'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'awesome_print'
  gem 'annotate', github: 'ctran/annotate_models'
  gem 'irbtools-more', require: 'irbtools/binding'
  gem 'seed_dump'
  gem 'meta_request' # used for Chrome Rails Panel addon
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
end

gem 'bootstrap-social-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'cocoon'
gem 'geocoder'
gem 'decanter'
gem 'jquery-rails'
gem 'sweet-alert2-rails'

# used for locations on venue form
gem 'jquery-ui-rails' # used for autocomplete
gem 'rails-jquery-autocomplete' # used for autocomplete

# used for avatars/photos
gem 'jasny-bootstrap-rails'
gem 'carrierwave'
gem 'simple_form_jasny_fileupload'
gem 'cloudinary'

# used for pagination
gem 'kaminari', github: 'amatsuda/kaminari', branch: 'master'
# used for real-time exception reporting
# gem 'sentry-raven'
# used for virtual attributes
gem 'virtus'

# used for enum fields
gem 'active_enum', github: 'adzap/active_enum'
# used for client-side validations
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'counter_culture', '~> 1.0'

gem 'goldiloader'
gem 'wysiwyg-rails' # Froala editor
