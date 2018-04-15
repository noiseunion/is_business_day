# spec/is_business_day/holidays_spec.rb
require 'spec_helper'

RSpec.describe IsBusinessDay::Holidays do
  before { load_rules }

  describe '#holiday?' do
    subject { date.holiday? }

    context 'when date is a holiday' do
      let(:date) { Time.zone.parse('25/12/2018') }
      it { is_expected.to eq true }
    end

    context 'when date is not a holiday' do
      let(:date) { Time.zone.parse('01/12/2018') }
      it { is_expected.to eq false }
    end
  end

  describe '#not_holiday?' do
    subject { date.not_holiday? }

    context 'when date is a holiday' do
      let(:date) { Time.zone.parse('25/12/2018') }
      it { is_expected.to eq false }
    end

    context 'when date is not a holiday' do
      let(:date) { Time.zone.parse('01/12/2018') }
      it { is_expected.to eq true }
    end
  end
end
