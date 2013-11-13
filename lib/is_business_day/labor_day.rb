require_relative 'labor_day/calculations'
require_relative 'labor_day/tests'

module IsBusinessDay
  module LaborDay
    extend ActiveSupport::Concern

    include Calculations
    include Tests
  end
end