require_relative "new_years_day/calculations"
require_relative "new_years_day/tests"

module IsBusinessDay
  module NewYearsDay
    extend ActiveSupport::Concern

    include Calculations
    include Tests
  end
end