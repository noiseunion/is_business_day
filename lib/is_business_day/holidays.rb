require_relative "memorial_day"
require_relative "fourth_of_july"
require_relative "labor_day"
require_relative "thanksgiving"
require_relative "christmas"
require_relative "new_years_day"

module IsBusinessDay
  module Holidays
    extend ActiveSupport::Concern

    include IsBusinessDay::MemorialDay
    include IsBusinessDay::FourthOfJuly
    include IsBusinessDay::LaborDay
    include IsBusinessDay::Thanksgiving
    include IsBusinessDay::Christmas
    include IsBusinessDay::NewYearsDay

    included do
      def is_a_holiday?
        self.is_memorial_day? || self.is_labor_day? || self.is_thanksgiving_day? || self.is_new_years_day? || self.is_xmas_day? || self.is_xmas_eve? || self.is_fourth_of_july?
      end
      alias_method :is_holiday?, :is_a_holiday?

      def is_not_a_holiday?
        self.is_not_memorial_day? && self.is_not_labor_day? && self.is_not_thanksgiving_day? && self.is_not_new_years_day? && self.is_not_xmas_day? && self.is_not_xmas_eve? && self.is_not_fourth_of_july?
      end
      alias_method :is_not_holiday?, :is_not_a_holiday?
    end
  end
end