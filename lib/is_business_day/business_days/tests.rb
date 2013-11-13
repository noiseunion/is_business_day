module IsBusinessDay
  module BusinessDays
    module Tests
      extend ActiveSupport::Concern

      included do
        def is_a_business_day?
          (self.monday? || self.tuesday? || self.wednesday? || self.thursday? || self.friday?) && self.is_not_a_holiday?
        end

        def is_not_a_business_day?
          !is_a_business_day?
        end
      end
    end
  end
end