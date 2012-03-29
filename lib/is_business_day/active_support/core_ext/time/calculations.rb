require 'time'

class Time
  include DigitalOpera::BusinessDayCalculations
  include DigitalOpera::HolidayCalculations
end