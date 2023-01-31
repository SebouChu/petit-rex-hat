source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "activestorage-scaleway-service", "~> 1.0"
gem "bootsnap", require: false
gem "breadcrumbs_on_rails", "~> 4.1"
gem "bugsnag", "~> 6.25"
gem "cssbundling-rails"
gem "devise", "~> 4.8"
gem "devise-i18n", "~> 1.10"
gem "dotenv-rails", "~> 2.8"
gem "image_processing", "~> 1.2"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "rails-i18n", "~> 7.0"
gem "simple_form", "~> 5.2"
gem "sprockets-rails"
gem "themoviedb", "~> 1.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "vcr", "~> 6.1"
  gem "webmock", "~> 3.18"
end

group :development do
  gem "annotate", "~> 3.2"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "simplecov", "~> 0.22.0"
  gem "webdrivers"
end
