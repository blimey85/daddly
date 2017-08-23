source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.1.2'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'redis', '~> 3.0'

gem 'active_enum', github: 'adzap/active_enum'
gem 'active_model_serializers', '~> 0.10.0'
gem 'activerecord-import'
gem 'bh'
gem 'bootsnap', require: false

# Authentication and Authorization
gem 'devise', '~> 4.2'
gem 'google-api-client', '0.8.2', require: 'google/api_client'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-twitter'

# Frontend Stuff
gem 'bootstrap-social-rails'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'cloudinary'
gem 'cocoon'
gem 'jquery-rails'
gem 'jquery-ui-rails' # used for autocomplete
gem 'rails-jquery-autocomplete' # used for autocomplete
gem 'simple_form'
gem 'slim-rails'
gem 'sweet-alert2-rails'
gem 'font-awesome-sass'
# gem 'wysiwyg-rails' # Froala editor

# Uploads
gem 'carrierwave'
gem 'jasny-bootstrap-rails'
gem 'simple_form_jasny_fileupload'

gem 'coffee-rails', '~> 4.2'
gem 'counter_culture', '~> 1.0'
# gem 'decanter'
gem 'geocoder'
gem 'gibbon'
gem 'goldiloader'
gem 'high_voltage'
gem 'kaminari', github: 'amatsuda/kaminari', branch: 'master'
gem 'meta-tags', require: 'meta_tags'
gem 'modernizr-rails'
gem 'nokogiri'
gem 'premailer-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'responders', '~> 2.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'virtus'

group :development do
  gem 'annotate', github: 'ctran/annotate_models'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', '~> 4.6.4', require: false
  gem 'guard-rubocop'
  gem 'guard-slimlint'
  gem 'irbtools-more', require: 'irbtools/binding'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request' # used for Chrome Rails Panel addon
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'seed_dump'
  gem 'spring-commands-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
end

gem 'mailboxer', github: 'mailboxer/mailboxer'
gem 'simple_discussion', github: 'excid3/simple_discussion'

group :production do
  gem 'sendgrid-actionmailer'
  gem 'sentry-raven'
  gem 'skylight'
end
