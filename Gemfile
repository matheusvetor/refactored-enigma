source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'active_model_serializers'

gem 'will_paginate'

gem 'api-pagination'

gem 'sidekiq'

gem 'redis'
gem 'redis-rails'

gem 'searchkick'

gem 'coveralls', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fasterer'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
  gem 'simplecov', require: false
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end
