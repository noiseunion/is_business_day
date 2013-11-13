module IsBusinessDay
  module Christmas
    module Day
      module Tests
        extend ActiveSupport::Concern

        included do
          def is_christmas_day?
            self.month == 12 && self.mday == 25
          end
          alias_method :is_xmas_day?, :is_christmas_day?

          def is_not_christmas_day?
            self.month != 12 || self.mday != 25
          end
          alias_method :is_not_xmas_day?, :is_not_christmas_day?
        end
      end
    end
  end
end