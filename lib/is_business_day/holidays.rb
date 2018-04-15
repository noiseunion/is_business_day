require 'YAML'

module IsBusinessDay
  module Holidays
    extend ActiveSupport::Concern

    def holiday?
      holiday_rules.values.map do |rule|
        rule.test?(self)
      end.any?
    end

    def not_holiday?
      !holiday?
    end
  end
end
