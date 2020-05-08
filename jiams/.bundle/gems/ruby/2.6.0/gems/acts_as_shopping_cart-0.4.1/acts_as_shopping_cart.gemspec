# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "acts_as_shopping_cart/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_shopping_cart"
  s.version     = ActsAsShoppingCart::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@padilla.io"]
  s.homepage    = ""
  s.summary     = "Simple Shopping Cart implementation"
  s.description = "Simple Shopping Cart implementation"

  s.rubyforge_project = "acts_as_shopping_cart"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "> 4"
  s.add_dependency "money-rails", "~> 1.5"

  s.add_development_dependency "cucumber"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "codeclimate-test-reporter"
end
