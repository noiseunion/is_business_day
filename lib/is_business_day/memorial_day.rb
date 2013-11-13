require_relative 'memorial_day/calculations'
require_relative 'memorial_day/tests'

module IsBusinessDay
  module MemorialDay
    extend ActiveSupport::Concern

    include Calculations
    include Tests
  end
end