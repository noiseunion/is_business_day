module IsBusinessDay
  module Christmas
    module Eve
      module Calculations
        extend ActiveSupport::Concern

        module ClassMethods
          def christmas_eve(date=Date.today)
            return_business_day Date.parse("12/24/#{ date.year }")
          end
          alias_method :xmas_eve, :christmas_eve
        end

        included do
          def christmas_eve
            self.class.christmas_eve(self)
          end
          alias_method :xmas_eve, :christmas_eve
        end
      end
    end
  end
end