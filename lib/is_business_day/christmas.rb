require_relative "christmas/eve/calculations"
require_relative "christmas/eve/tests"
require_relative "christmas/day/calculations"
require_relative "christmas/day/tests"

module IsBusinessDay
  module Christmas
    extend ActiveSupport::Concern

    include Eve::Calculations
    include Eve::Tests
    include Day::Calculations
    include Day::Tests
  end
end