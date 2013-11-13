module IsBusinessDay
  module Christmas
    module Day
      module Calculations
        extend ActiveSupport::Concern

        module ClassMethods
          def christmas_day(date = Date.today)
            return_business_day Date.parse("12/25/#{ date.year }")
          end
          alias_method :xmas_day, :christmas_day
        end

        included do
          def christmas_day
            self.class.christmas_day(self)
          end
          alias_method :xmas_day, :christmas_day
        end
      end
    end
  end
end