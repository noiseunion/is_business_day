# spec/support/helpers/holiday_rules_helper.rb

def load_rules
  IsBusinessDay.configure do |config|
    config.holiday_config = Pathname.new('holidays.yml')
  end

  Time.load_holidays
  Date.load_holidays
  ActiveSupport::TimeWithZone.load_holidays
end
