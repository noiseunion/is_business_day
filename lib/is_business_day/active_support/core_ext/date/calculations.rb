require 'date'

class Date
  include DigitalOpera::BusinessDayCalculations
  include DigitalOpera::HolidayCalculations
end