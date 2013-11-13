require "active_support"
require "is_business_day/version"
require "is_business_day/holidays"
require "is_business_day/business_days"
require "is_business_day/helpers"

module IsBusinessDay
  extend ActiveSupport::Concern
  include Holidays
  include BusinessDays
  include Helpers
end

class Time
  include IsBusinessDay
end

class Date
  include IsBusinessDay
end