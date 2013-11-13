require_relative 'thanksgiving/calculations'
require_relative 'thanksgiving/tests'

module IsBusinessDay
  module Thanksgiving
    extend ActiveSupport::Concern

    include Calculations
    include Tests

  end
end