source "https://rubygems.org"

ruby "~> 3.3.0"

gem "rails", "~> 7.0.0"
gem "pg", "~> 1.5"
gem "puma", "~> 6.0"

gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# React Rails
gem "react-rails"

# Asset bundling
gem "jsbundling-rails"
gem "cssbundling-rails"

# Mailbox and incineration
gem "actionmailbox", "~> 7.0.0"
gem "activestorage", "~> 7.0.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Authentication
gem "devise"

# Excel export
gem "caxlsx"
gem "caxlsx_rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "listen"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
