module IsBusinessDay
  module BusinessDays
    module Calculations
      extend ActiveSupport::Concern

      included do
        def next_business_day
          next_business_day = self

          begin
            next_business_day = (next_business_day.to_time + 1.day).to_date
          end while next_business_day.is_not_a_business_day?

          return_business_day next_business_day
        end

        def previous_business_day
          previous_business_day = self

          begin
            previous_business_day = (previous_business_day.to_time - 1.day).to_date
          end while previous_business_day.is_not_a_business_day?

          return_business_day previous_business_day
        end
      end
    end
  end
end