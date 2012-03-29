require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'

module DigitalOpera
  module BusinessDayCalculations
    # Returns TRUE || FALSE if the date is a valid business day
    # this also accounts for holidays
    #
    def is_a_business_day?
      (self.monday? || self.tuesday? || self.wednesday? || self.thursday? || self.friday?)
    end

    # Returns TRUE || FALSE if the date IS NOT a valid business day
    # this also accounts for holidays
    #
    def is_not_a_business_day?
      self.saturday? || self.sunday?
    end

    # Returns the first business day following the date.  This will account for
    # ANY non-business day, holidays included.
    #
    def next_business_day
      next_business_day = self

      begin
        next_business_day = (next_business_day.to_time + 1.day).to_date
      end while next_business_day.is_not_a_business_day?

      if self.class.name == "Time"
        return next_business_day.to_time
      else
        return next_business_day
      end
    end

    # Returns the first business day preceding the date.  This will account for
    # ANY non-business day, holidays included.
    #
    def previous_business_day
      previous_business_day = self

      begin
        previous_business_day = (previous_business_day.to_time - 1.day).to_date
      end while previous_business_day.is_not_a_business_day?

      if self.class.name == "Time"
        return previous_business_day.to_time
      else
        return previous_business_day
      end
    end
  end
end