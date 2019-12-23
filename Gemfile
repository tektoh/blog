# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "5.2.3"

gem "bootsnap", require: false
gem "bundler-audit"
gem "sdoc", "~> 0.4.0", group: :doc
gem "therubyracer"

# Assets
gem "bootstrap-sass"
gem "coffee-rails"
gem "font-awesome-rails"
gem "sass-rails"
gem "uglifier"
gem "webpacker"

# UI/UX
gem "actionpack-action_caching"
gem "rails-i18n", "~> 5.0.0"
gem "turbolinks"
gem "jbuilder"
gem "meta-tags"
gem "rouge"
gem "slim-rails"

# Authentication
gem "pundit"
gem "sorcery"

# Configuration
gem "config"

# Database
gem "hiredis"
gem "pg"
gem "redis"
gem "redis-session-store"

# Seeds
gem "seed-fu"

# Pagination
gem "kaminari"
gem "kaminari-i18n"
gem "bootstrap4-kaminari-views"

# Breadcrumbs
gem "gretel"

# Form
gem "cocoon"
gem "simple_form"

# Soft delete
gem "paranoia"
gem "paranoia_uniqueness_validator"

# Model
gem "active_hash"
gem "enum_help"
gem "virtus"

# Validation
gem "file_validators"
gem "validate_url"
gem "validates_email_format_of"

# Decorator
gem "draper"

# Storage
gem "carrierwave"
gem "carrierwave-aws"
gem "mini_magick"

# HTTP Client
gem "faraday"
gem "mime-types"

# Application server
gem "puma"

# Background Job
gem "resque"
gem "whenever", require: false

group :staging, :production do
  gem "rails_12factor"
end

group :development do
  gem "listen"
  gem "web-console"
end

group :development, :test do
  gem "dotenv-rails", require: "dotenv/rails-now"
  gem "sqlite3"

  gem "guard"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "guard-slimlint"

  # Email
  gem "letter_opener_web"

  # CLI
  gem "spring"
  gem "spring-commands-rspec"

  # Test
  gem "factory_bot_rails"
  gem "faker"
  gem "database_cleaner"
  gem "rspec_junit_formatter"
  gem "rspec-rails"

  # Code analyze
  gem "brakeman", require: false
  gem "bullet"
  gem "coffeelint"
  gem "rails_best_practices"
  gem "reek"
  gem "rubocop", "0.62"
  gem "rubocop-rails_config"
  gem "scss_lint", require: false
  gem "slim_lint"

  # Debugger
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug"
  gem "debase"
  gem "pry"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "ruby-debug-ide"

  # Print debug
  gem "awesome_print"
  gem "tapp"

  # Table/Schema
  gem "annotate"
  gem "migration_comments"
  gem "rails-erd"
end

group :test do
  gem "capybara"
  gem "fuubar"
  gem "launchy"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webdrivers"
end
