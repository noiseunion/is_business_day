module IsBusinessDay
  module NewYearsDay
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_new_years_day?
          self.yday == 1
        end

        def is_not_new_years_day?
          self.yday != 1
        end
      end
    end
  end
end