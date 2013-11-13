module IsBusinessDay
  module Helpers
    extend ActiveSupport::Concern

    module ClassMethods
      private # -------------------------------------------

      def return_business_day(date)
        if self == Time
          return date.to_time
        else
          return date
        end
      end
    end

    included do
      def get_all_specific_days_in_month(day=:monday)
        date = self.to_date
        days = date.beginning_of_month.step(date.end_of_month, 1).to_a

        case day
        when :monday
          days.map!{ |d| d if d.monday? }
        when :tuesday
          days.map!{ |d| d if d.tuesday? }
        when :wednesday
          days.map!{ |d| d if d.wednesday? }
        when :thursday
          days.map!{ |d| d if d.thursday? }
        when :friday
          days.map!{ |d| d if d.friday? }
        when :saturday
          days.map!{ |d| d if d.saturday? }
        when :sunday
          days.map!{ |d| d if d.sunday? }
        end

        return days.compact
      end

      private # -----------------------------------------

      def return_business_day(date = self)
        if self.class == Time
          return date.to_time
        else
          return date
        end
      end
    end
  end
end