source 'https://rubygems.org'
ruby "2.2.2"
# load before most everything else
gem "dotenv-rails", require: 'dotenv/rails-now', groups: [:development, :test]

gem 'rails', '4.2.1'
gem 'pg'
gem 'bcrypt', '~> 3.1.7'
gem 'grape'
gem 'hashie-forbidden_attributes' # helpful for using grape
gem 'puma'
gem 'devise'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'rack-test'
  gem "factory_girl_rails", "~> 4.0"
end
