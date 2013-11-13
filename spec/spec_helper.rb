require 'spork'
require 'active_support/all'
require 'american_date'

Spork.prefork do
  require 'rspec'
  require 'rspec/autorun'
  require 'is_business_day'

  # Configure RSpec ---------------------------------------
  RSpec.configure do |config|
    config.order          = "random"
  end
end