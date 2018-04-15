$:.push File.expand_path('../lib', __FILE__)
require 'is_business_day/version'

Gem::Specification.new do |s|
  s.name        = 'is_business_day'
  s.version     = IsBusinessDay::VERSION
  s.authors     = ['JD Hendrickson']
  s.email       = ['jd@digitalopera.com']
  s.license     = 'MIT'
  s.homepage    = 'http://www.digitalopera.com/'
  s.summary     = 'Simple business day detection'
  s.description = 'Adds some methods to the Ruby Date object for testing whether or not a specific date falls on a valid business day or not'

  s.rubyforge_project = 'is_business_day'

  s.files         = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files    = Dir['spec/**/*']
  s.require_paths = ['lib']

  # Dependencies ------------------------------------------
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'guard',       '~> 2.14.0'
  s.add_development_dependency 'guard-rspec', '~> 4.7.3'
  s.add_development_dependency 'guard-rubycritic', '~> 2.9.3'
  s.add_development_dependency 'rake',        '~> 12.3.0'
  s.add_development_dependency 'rspec',       '~> 3.7.0'
  s.add_development_dependency 'rubocop',     '~> 0.54.0'
  s.add_development_dependency 'rubycritic',  '~> 3.4.0'
  s.add_development_dependency 'simplecov',   '~> 0.16'

  s.add_dependency 'activesupport', '>= 3.0', '< 6.0'

  s.add_runtime_dependency 'gem_config', '~> 0.3.1'
end
