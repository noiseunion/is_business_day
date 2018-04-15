# lib/is_business_day/holiday_rules.rb
module IsBusinessDay
  module HolidayRules
    extend ActiveSupport::Concern

    included do
      class_attribute :holiday_rules
      self.holiday_rules = {}

      load_holidays
    end

    module ClassMethods
      # Load the holiday config file if available.
      ##
      def load_holidays
        file = IsBusinessDay.configuration.holiday_config
        return unless file
        holidays = ::YAML.load_file(file) || []

        holidays.each do |holiday|
          holiday.symbolize_keys!
          name = holiday.delete(:name)
          register_rule(name, holiday)
          register_test_method(name)
        end
      end

      # Register a new HolidayRule for the class
      # @param [String, Symbol] name
      # @param [Hash] options
      # @return Nil
      ##
      def register_rule(name, options)
        self.holiday_rules = holiday_rules.merge(
          name.to_sym => IsBusinessDay::HolidayRule.new(name, options)
        )
      end

      # Register the test method for the rule.  For example #christmas_day?
      # @param [String, Symbol] name: the name of the rule we are registering
      # @return Nil
      ##
      def register_test_method(name)
        rule = holiday_rules[name.to_sym]
        return unless rule
        method_name = "#{rule.name}?".to_sym
        define_method method_name do
          rule.test?(self)
        end
      end
    end
  end
end
