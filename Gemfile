source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
gem "actionview", ">= 5.2.4.2"
gem 'sqlite3'
gem 'puma', '~> 4.3.9'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'faker',          '1.7.3'
gem 'bcrypt',         '3.1.13'
gem 'bootstrap-sass', '3.4.1'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'rails-i18n'
gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'
gem 'mini_magick',             '4.9.4'
gem 'fog', '1.42'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '4.3.1'
gem 'jquery-turbolinks'
gem 'nokogiri', '1.10.9'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.13.0'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
