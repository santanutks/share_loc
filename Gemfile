source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# authentication
gem 'devise'

gem 'carmen'
gem 'geocoder'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
end

gem 'figaro'
gem 'puma'
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'quiet_assets'
  gem 'spring-commands-rspec'
  gem 'faker'
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

group :test do
  gem 'shoulda-matchers'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
