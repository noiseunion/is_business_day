module IsBusinessDay
  module Thanksgiving
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_thanksgiving_day?
          turkey_day = self.class
                        .parse("11/01/#{ self.year }")
                        .get_all_specific_days_in_month(:thursday)
                        .last

          self.month == 11 && self.day == turkey_day.day
        end

        def is_not_thanksgiving_day?
          !is_thanksgiving_day?
        end
      end
    end
  end
end