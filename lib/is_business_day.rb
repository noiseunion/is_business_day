require 'active_support'
require 'gem_config'
require 'is_business_day/holiday_rule'
require 'is_business_day/version'
require 'is_business_day/holidays'
require 'is_business_day/holiday_rules'
require 'is_business_day/business_days'

module IsBusinessDay
  extend ActiveSupport::Concern
  include Holidays
  include HolidayRules
  include BusinessDays
  include GemConfig::Base

  with_configuration do
    has :holiday_config
  end
end

class Time
  include IsBusinessDay
end

class Date
  include IsBusinessDay
end
