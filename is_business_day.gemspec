# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "is_business_day/version"

Gem::Specification.new do |s|
  s.name        = "is_business_day"
  s.version     = IsBusinessDay::VERSION
  s.authors     = ["JD Hendrickson"]
  s.email       = ["jd@digitalopera.com"]
  s.license     = 'MIT'
  s.homepage    = "http://www.digitalopera.com/"
  s.summary     = %q{Simple business day detection}
  s.description = %q{Adds some methods to the Ruby Date object for testing whether or not a specific date falls on a valid business day or not}

  s.rubyforge_project = "is_business_day"

  s.files         = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]

  # Dependencies --------------------------------------------------------------
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency 'guard-spork', '~> 1.5.0'
  s.add_development_dependency "rake"

  s.add_dependency "activesupport", ">= 3.0"
  s.add_dependency "american_date", "~> 1.1.0"
end
