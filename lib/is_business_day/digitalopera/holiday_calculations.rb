require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/time/calculations'
require 'active_support/core_ext/array/access'

module DigitalOpera
  module HolidayCalculations
    # Returns TRUE || FALSE if the date is a recognized holiday
    #
    def is_a_holiday?
      self.is_memorial_day? || self.is_labor_day? || self.is_thanksgiving_day? || self.is_new_years_day? || self.is_xmas_day? || self.is_xmas_eve? || self.is_fourth_of_july?
    end

    # Returns TRUE || FALSE if the date IS NOT a recognized holiday
    #
    def is_not_a_holiday?
      self.is_not_memorial_day? && self.is_not_labor_day? && self.is_not_thanksgiving_day? && self.is_not_new_years_day? && self.is_not_xmas_day? && self.is_not_xmas_eve? && self.is_not_fourth_of_july?
    end

    # Labor Day (First monday in september)
    # http://en.wikipedia.org/wiki/Labor_Day
    #
    def labor_day_this_year
      september = Date.parse("01/09/#{self.year}")
      labor_day = september.beginning_of_month.step(september.end_of_month, 1).map{ |day| day if day.monday? }.compact.first
      if self.class.name == "Time"
        return labor_day.to_time
      else
        return labor_day
      end
    end

    def is_labor_day?
      self == self.labor_day_this_year
    end

    def is_not_labor_day?
      self != self.labor_day_this_year
    end

    # Memorial Day (Last monday in may)
    # http://en.wikipedia.org/wiki/Memorial_Day
    #
    def memorial_day_this_year
      may           = Date.parse("01/05/#{self.year}")
      memorial_day  = may.beginning_of_month.step(may.end_of_month, 1).map{ |day| day if day.monday? }.compact.last
      if self.class.name == "Time"
        return memorial_day.to_time
      else
        return memorial_day
      end
    end

    def is_memorial_day?
      self == self.memorial_day_this_year
    end

    def is_not_memorial_day?
      self != self.memorial_day_this_year
    end

    # Thanksgiving Day (fourth thursday in november in the US)
    # http://en.wikipedia.org/wiki/Thanksgiving
    #
    def thanksgiving_day_this_year
      november          = Date.parse("01/11/#{self.year}")
      thanksgiving_day  = november.beginning_of_month.step(november.end_of_month, 1).map{ |day| day if day.thursday? }.compact.fourth
      if self.class.name == "Time"
        return thanksgiving_day.to_time
      else
        return thanksgiving_day
      end
    end

    def is_thanksgiving_day?
      self == self.thanksgiving_day_this_year
    end

    def is_not_thanksgiving_day?
      self != self.thanksgiving_day_this_year
    end

    # Christmas Day (December 25th) & Christmas Eve (December 24th)
    # Since these holidays do not change from year to year, we are only providing
    # boolean checks
    #
    def is_christmas_day?
      self.month == 12 && self.mday == 25
    end
    alias_method :is_xmas_day?, :is_christmas_day?

    def is_not_christmas_day?
      self.month != 12 || self.mday != 25
    end
    alias_method :is_not_xmas_day?, :is_not_christmas_day?

    def is_christmas_eve?
      self.month == 12 && self.mday == 24
    end
    alias_method :is_xmas_eve?, :is_christmas_eve?

    def is_not_christmas_eve?
      self.month != 12 || self.mday != 24
    end
    alias_method :is_not_xmas_eve?, :is_not_christmas_eve?

    # New Years Day (January 1st)
    # Since this holiday does not change, it is always January 1st, we are only providing
    # boolean checks
    #
    def is_new_years_day?
      self.yday == 1
    end

    def is_not_new_years_day?
      self.yday != 1
    end

    # July 4th
    # Since this holiday does not change we are only providing boolean checks
    #
    def is_fourth_of_july?
      self.month == 7 && self.mday == 4
    end

    def is_not_fourth_of_july?
      self.month != 7 || self.mday != 4
    end
  end
end