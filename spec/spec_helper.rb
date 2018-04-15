require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'active_support/all'
require 'rspec'
require 'is_business_day'
require 'byebug'

# We will set a default timezone for specs
Time.zone = 'Mountain Time (US & Canada)'

# Load support files
Dir.glob('spec/support/**/*.rb').each do |f|
  require "./#{f}"
end

RSpec.configure do |config|
  config.order = 'random'
end
