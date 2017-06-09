source 'https://rubygems.org'

gem 'bundler'
gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'

# ENV Config
gem 'dotenv', '~> 2.0'

# ORM
gem 'pg'
gem 'activerecord'
gem 'sinatra-activerecord'

# Serializers
gem 'sinatra-active-model-serializers'

# For role based authorization
gem 'role_model'

# For Exception logging
gem "sentry-raven"

# REST Client
gem 'rest-client'

# CORS
gem "sinatra-cross_origin", "~> 0.3.1"

# Redis
gem 'redis', '~>3.2'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'minitest'
  gem 'mocha'
  gem 'codeclimate-test-reporter'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :production do
  gem 'puma'
end