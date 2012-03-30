# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "is_business_day/version"

Gem::Specification.new do |s|
  s.name        = "is_business_day"
  s.version     = IsBusinessDay::VERSION
  s.authors     = ["JD Hendrickson"]
  s.email       = ["jd@digitalopera.com"]
  s.homepage    = ""
  s.summary     = %q{Simple business day detection}
  s.description = %q{Adds some methods to the Ruby Date object for testing whether or not a specific date falls on a valid business day or not}

  s.rubyforge_project = "is_business_day"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Dependencies --------------------------------------------------------------
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "guard-rspec", "~> 0.0"
  s.add_test_dependency "rake", "~> 0.9.2"
  s.add_dependency "activesupport", "~>3.0"
end
