module IsBusinessDay
  module BusinessDays
    module Calculations
      extend ActiveSupport::Concern

      # Return the next business day from self
      # @return [Time] time with time zone
      ##
      def next_business_day
        nbd = clone

        loop do
          nbd += 1.day
          break if nbd.business_day?
        end

        nbd
      end

      # Return the previous business day from self
      # @return [Time] time with time zone
      ##
      def previous_business_day
        pbd = clone

        loop do
          pbd -= 1.day
          break if pbd.business_day?
        end

        pbd
      end
    end
  end
end
