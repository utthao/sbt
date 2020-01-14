source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bcrypt", ">=3.1.11"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-will_paginate", ">=1.0.0"
gem "bootstrap-sass"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.3"
gem "rails-i18n", ">=1.7.0"
gem "sass-rails", "~> 5.0"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2", "~> 0.5.2"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "faker", "1.7.3"
gem "figaro"
gem "will_paginate", "~> 3.1", ">= 3.1.6"

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "rubocop", "~> 0.54.0", require: false
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "rails_12factor", "0.0.2"
  gem "fog", "1.42"
end
