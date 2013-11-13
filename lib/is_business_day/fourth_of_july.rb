require_relative 'fourth_of_july/calculations'
require_relative 'fourth_of_july/tests'

module IsBusinessDay
  module FourthOfJuly
    extend ActiveSupport::Concern

    include Calculations
    include Tests
  end
end