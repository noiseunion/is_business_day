require 'active_support'
require 'gem_config'
require 'is_business_day/holiday_rule'
require 'is_business_day/version'
require 'is_business_day/holidays'
require 'is_business_day/holiday_rules'
require 'is_business_day/business_days'

module IsBusinessDay
  extend ActiveSupport::Concern
  include GemConfig::Base
  include HolidayRules
  include BusinessDays
  include Holidays

  with_configuration do
    has :holiday_config
  end
end

module ActiveSupport
  class TimeWithZone
    include IsBusinessDay
  end
end

class Time
  include IsBusinessDay
end

class Date
  include IsBusinessDay
end
