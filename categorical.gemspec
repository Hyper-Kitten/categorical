$:.push File.expand_path("../lib", __FILE__)

require "categorical/version"

Gem::Specification.new do |s|
  s.name        = "categorical"
  s.version     = Categorical::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "https://github.com/jklina/categorical"
  s.summary     = "Provides basic tagging for Rails applications"
  s.description = "Categorical allows for any Rails model to become taggable and provides utility methods for managing tags and taggables."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.add_dependency "rails", ">= 4.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "pry-rails"
end
