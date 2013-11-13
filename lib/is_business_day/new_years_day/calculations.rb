module IsBusinessDay
  module NewYearsDay
    module Calculations
      extend ActiveSupport::Concern

      module ClassMethods
        def new_years_day(date=Date.today)
          return_business_day Date.parse("01/01/#{ date.year }")
        end
      end

      included do
        def new_years_day
          self.class.new_years_day(self)
        end
      end
    end
  end
end