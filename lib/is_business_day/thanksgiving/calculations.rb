module IsBusinessDay
  module Thanksgiving
    module Calculations
      extend ActiveSupport::Concern

      module ClassMethods
        def thanksgiving_day(date = Date.today)
          turkey_day  = Date
                          .parse("11/01/#{ date.year }")
                          .get_all_specific_days_in_month(:thursday)
                          .last

          return_business_day turkey_day
        end
      end

      included do
        def thanksgiving_day
          self.class.thanksgiving_day(self)
        end
      end
    end
  end
end