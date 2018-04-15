require 'spec_helper'

RSpec.describe IsBusinessDay::HolidayRules do
  describe '#load_holidays' do
    before { load_rules }

    it 'should have configured holidays' do
      expect(Time.holiday_rules).to_not be_empty
      expect(Date.holiday_rules).to_not be_empty
    end
  end
end
