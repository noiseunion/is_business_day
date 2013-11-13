module IsBusinessDay
  module Christmas
    module Eve
      module Tests
        extend ActiveSupport::Concern

        included do
          def is_christmas_eve?
            self.month == 12 && self.mday == 24
          end
          alias_method :is_xmas_eve?, :is_christmas_eve?

          def is_not_christmas_eve?
            self.month != 12 || self.mday != 24
          end
          alias_method :is_not_xmas_eve?, :is_not_christmas_eve?
        end
      end
    end
  end
end