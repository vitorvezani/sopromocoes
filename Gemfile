source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Roo implements read access for all common spreadsheet types.
gem 'roo', '~> 2.3.2'
# RSpec is a Behaviour-Driven Development tool for Ruby programmers
gem 'rspec'
#-- Rails Assets
gem 'bundler', '>= 1.8.4'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-angular'
  gem 'rails-assets-ngInfiniteScroll'
end
#-- Rails Assets

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Devise
gem 'devise', '~> 3.5', '>= 3.5.3'
# Cancan
gem 'cancan', '~> 1.6', '>= 1.6.10'
# Paperclip
gem 'paperclip', '~> 4.3', '>= 4.3.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'faker'
end

# New Relic
# gem 'rails_best_practices'
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Better Erros; Note: If you discover that Better Errors isn't working - particularly after upgrading from version 0.5.0 or less - be sure to set config.consider_all_requests_local = true in config/environments/development.rb.
  gem "better_errors", '~> 2.1', '>= 2.1.1'
  # Bind of caller
  gem "binding_of_caller", '~> 0.7.2'
  # Pry
  gem 'pry', '~> 0.10.3'
  # Rack-mini-profiler
  gem 'rack-mini-profiler', '~> 0.9.8'
  # bullet
  gem 'bullet', '~> 4.14', '>= 4.14.10'
	# awesome_print
	gem 'awesome_print', '~> 1.6', '>= 1.6.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #  Quiete Assets
  gem 'quiet_assets', '~> 1.1'
  #  Bootstrap-generators provides Twitter Bootstrap generators for Rails 4 (supported Rails >= 3.1). Bootstrap is a toolkit from Twitter 
  #  designed to kickstart development of webapps and sites.
  #  https://github.com/decioferreira/bootstrap-generators
  gem 'bootstrap-generators', '~> 3.3.4'
end

group :test do
  gem 'factory_girl'
end