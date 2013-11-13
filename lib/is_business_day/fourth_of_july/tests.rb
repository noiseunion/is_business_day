module IsBusinessDay
  module FourthOfJuly
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_fourth_of_july?
          self.month == 7 && self.mday == 4
        end

        def is_not_fourth_of_july?
          self.month != 7 || self.mday != 4
        end
      end
    end
  end
end