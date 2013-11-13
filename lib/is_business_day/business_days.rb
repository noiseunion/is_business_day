require_relative 'business_days/calculations'
require_relative 'business_days/tests'

module IsBusinessDay
  module BusinessDays
    extend ActiveSupport::Concern

    include Calculations
    include Tests
  end
end