module IsBusinessDay
  module BusinessDays
    module Tests
      extend ActiveSupport::Concern

      # Return true if the date/time is a business day
      # @return [Boolean]
      ##
      def business_day?
        (monday? || tuesday? || wednesday? || thursday? || friday?) && not_holiday?
      end

      # Return true if the date/time is NOT a business day
      # @return [Boolean]
      ##
      def not_business_day?
        !business_day?
      end
    end
  end
end
