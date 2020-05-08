require "bundler/setup"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "active_record"
require "database_cleaner"
require "money-rails"
require "rspec"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "acts_as_shopping_cart"

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

MoneyRails::Hooks.init

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end

require "simplecov"

SimpleCov.coverage_dir "coverage.features"
SimpleCov.start
