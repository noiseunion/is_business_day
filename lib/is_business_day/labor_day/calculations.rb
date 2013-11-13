module IsBusinessDay
  module LaborDay
    module Calculations
      extend ActiveSupport::Concern

      module ClassMethods
        def labor_day(date=Date.today)
          september  = Date.parse("09/01/#{ date.year }")
          labor_day  = september.get_all_specific_days_in_month(:monday).first

          return_business_day labor_day
        end
      end

      included do
        def labor_day
          self.class.labor_day(self)
        end
      end
    end
  end
end