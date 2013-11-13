module IsBusinessDay
  module MemorialDay
    module Calculations
      extend ActiveSupport::Concern

      module ClassMethods
        def memorial_day(date=Date.today)
          memorial_day  = Date
                            .parse("05/01/#{ date.year }")
                            .get_all_specific_days_in_month(:monday)
                            .last

          return_business_day memorial_day
        end
      end

      included do
        def memorial_day
          self.class.memorial_day(self)
        end
      end
    end
  end
end