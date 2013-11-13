module IsBusinessDay
  module LaborDay
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_labor_day?
          labor_day  = self.class.parse("09/01/#{ self.year }").get_all_specific_days_in_month(:monday).first
          self.month == 9 && self.day == labor_day.day
        end

        def is_not_labor_day?
          !is_labor_day?
        end
      end
    end
  end
end