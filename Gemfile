source 'https://rubygems.org'

# Ruby Version
ruby '2.3.0'
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
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Roo implements read access for all common spreadsheet types.
gem 'roo', '~> 2.3.2'
gem 'roo-xls'
# RSpec is a Behaviour-Driven Development tool for Ruby programmers
gem 'rspec'
#-- Rails Assets
gem 'bundler', '>= 1.8.4'
# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff http://rails-i18n.org
gem 'rails-i18n', '~> 4.0.0'
# https://devcenter.heroku.com/articles/rails-integration-gems
gem 'rails_12factor'

#-- Rails Assets
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-angular'
  gem 'rails-assets-ngInfiniteScroll'
  gem 'rails-assets-sweetalert'
end

# Integrates the Twitter Bootstrap pagination component with will_paginate
# https://github.com/bootstrap-ruby/will_paginate-bootstrap
gem 'will_paginate-bootstrap'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Deploying a Ruby app on a Heroku production server
gem "passenger"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Fontawesome - https://github.com/bokmann/font-awesome-rails
gem "font-awesome-rails"

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Devise
gem 'devise', '~> 3.5', '>= 3.5.3'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

# Cancan
gem 'cancan', '~> 1.6', '>= 1.6.10'

# Paperclip
gem 'paperclip', '~> 4.3', '>= 4.3.2'

# Acts As Votable is a Ruby Gem specifically written for Rails/ActiveRecord models.
gem 'acts_as_votable', '~> 0.10.0'

# The ActiveRecord acts_as_commentable plugin -> https://github.com/jackdempsey/acts_as_commentable
gem 'acts_as_commentable'

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

  # Help to kill N+1 queries and unused eager loading - https://github.com/flyerhzm/bullet
  gem "bullet", '~> 4.14', '>= 4.14.10'
end

group :test do
  gem 'factory_girl'
end
