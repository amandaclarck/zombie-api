# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 3.7'
gem 'rails', '5.2.2'

group :development, :test do
  gem 'byebug'
  gem 'pg'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
