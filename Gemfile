# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.2.0'

gem 'passenger'
gem 'pg'

gem 'active_model_serializers'

gem 'will_paginate'

gem 'sidekiq'

gem 'redis'
gem 'redis-rails'

gem 'searchkick'

gem 'faker'

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'fasterer'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
  gem 'simplecov', require: false
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
