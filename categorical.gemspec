$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "categorical/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "categorical"
  s.version     = Categorical::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "http://joshklina.com"
  s.summary     = "Provides basic tagging for Rails applications"
  s.description = "Categorical allows for any Rails model to become taggable and provides utility methods for managing tags and taggables"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "pg"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "factory_girl_rails"
end
