# frozen_string_literal: true

gem 'dotenv-rails', groups: %i[development test]

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'activerecord-postgres-earthdistance'
gem 'acts_as_paranoid'
gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.2'
gem 'friendly_id', '~> 5.4.0'
gem 'http'
gem 'image_processing'
gem 'jbuilder', '~> 2.7'
gem 'mini_magick', '~> 4.12'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7'
gem 'ransack'
gem 'react-rails'
gem 'sass-rails', '>= 6'
gem 'sprockets-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'
gem 'rack-mini-profiler', '~> 3.0'
gem 'bullet'
gem 'xmpp4r'
gem 'selenium-webdriver', '>= 4.0.0.rc1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'foreman'
  gem 'listen', '~> 3.3'
  gem 'rubocop'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'webdrivers'
end
