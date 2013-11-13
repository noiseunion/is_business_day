module IsBusinessDay
  module FourthOfJuly
    module Calculations
      extend ActiveSupport::Concern

      module ClassMethods
        def fourth_of_july(date=Date.today)
          return_business_day Date.parse("07/04/#{ date.year }")
        end
      end

      included do
        def fourth_of_july
          self.class.fourth_of_july(self)
        end
      end
    end
  end
end