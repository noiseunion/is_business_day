# spec/is_business_day/business_days/tests_spec.rb
require 'spec_helper'

RSpec.describe IsBusinessDay::BusinessDays::Tests do
  let(:saturday) { Time.zone.parse('16/11/2013') }
  let(:monday) { Time.zone.parse('12/11/2013') }
  let(:xmas) { Time.zone.parse('25/12/2018') }

  before { load_rules }

  describe '#business_day?' do
    it 'should know what is a business day' do
      expect(saturday.business_day?).to eq false
      expect(monday.business_day?).to eq true
      expect(xmas.business_day?).to eq false
    end
  end

  describe '#not_business_day?' do
    it 'should know what is not a business day' do
      expect(saturday.not_business_day?).to eq true
      expect(monday.not_business_day?).to eq false
      expect(xmas.not_business_day?).to eq true
    end
  end
end
