# -*- encoding: utf-8 -*-
# stub: money-rails 1.13.3 ruby lib

Gem::Specification.new do |s|
  s.name = "money-rails".freeze
  s.version = "1.13.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/RubyMoney/money-rails/issues", "changelog_uri" => "https://github.com/RubyMoney/money-rails/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/RubyMoney/money-rails/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andreas Loupasakis".freeze, "Shane Emmons".freeze, "Simone Carletti".freeze]
  s.date = "2019-10-16"
  s.description = "This library provides integration of RubyMoney - Money gem with Rails".freeze
  s.email = ["alup.rubymoney@gmail.com".freeze]
  s.homepage = "https://github.com/RubyMoney/money-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Money gem integration with Rails".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<money>.freeze, ["~> 6.13.2"])
    s.add_runtime_dependency(%q<monetize>.freeze, ["~> 1.9.0"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0"])
    s.add_runtime_dependency(%q<railties>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<rails>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.6.1"])
    s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<money>.freeze, ["~> 6.13.2"])
    s.add_dependency(%q<monetize>.freeze, ["~> 1.9.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
    s.add_dependency(%q<railties>.freeze, [">= 3.0"])
    s.add_dependency(%q<rails>.freeze, [">= 3.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6.1"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
  end
end
