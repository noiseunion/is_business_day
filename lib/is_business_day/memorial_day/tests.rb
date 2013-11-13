module IsBusinessDay
  module MemorialDay
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_memorial_day?
          memorial_day  = self.class
                            .parse("05/01/#{ self.year }")
                            .get_all_specific_days_in_month(:monday)
                            .last

          self.month == 5 && self.day == memorial_day.day
        end

        def is_not_memorial_day?
          !is_memorial_day?
        end
      end
    end
  end
end