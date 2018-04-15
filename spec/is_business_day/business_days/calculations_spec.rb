# spec/is_business_day/business_days/calculations_spec.rb
require 'spec_helper'

RSpec.describe IsBusinessDay::BusinessDays::Calculations do
  let(:friday) { Time.zone.parse('15/11/2013') }
  let(:monday) { Time.zone.parse('11/11/2013') }

  describe '#next_business_day' do
    it 'should return the following monday' do
      expect(friday.next_business_day).to eq Time.zone.parse('18/11/2013')
    end

    it 'should return the following tuesday' do
      expect(monday.next_business_day).to eq Time.zone.parse('12/11/2013')
    end
  end

  describe '#previous_business_day' do
    it 'should return the previous thursday' do
      expect(friday.previous_business_day).to eq Time.zone.parse('14/11/2013')
    end

    it 'should return the previous friday' do
      expect(monday.previous_business_day).to eq Time.zone.parse('8/11/2013')
    end
  end
end
