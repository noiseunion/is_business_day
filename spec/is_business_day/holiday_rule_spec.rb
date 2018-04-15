# spec/is_business_day/holiday_rule_spec.rb
require 'spec_helper'

RSpec.describe IsBusinessDay::HolidayRule do
  let(:moving_rule) { { rule: :fourth_thursday, month: 11 } }
  let(:fixed_rule) { { day: 10, month: 5 } }
  let(:invalid_rule) { { month: 1 } }

  describe '#test?' do
    context 'when the rule is invalid' do
      let(:date) { Time.zone.parse('8/11/2012') }
      subject { described_class.new(:myrule, invalid_rule) }

      it 'should return false' do
        expect(subject.test?(date)).to eq false
      end
    end

    context 'the rule is moving' do
      subject { described_class.new(:myrule, moving_rule) }

      context 'when the date does not match the rule' do
        let(:date) { Time.zone.parse('8/11/2012') }

        it 'should return false' do
          expect(subject.test?(date)).to eq false
        end
      end

      context 'when the date matches the rule' do
        let(:date) { Time.zone.parse('22/11/2012') }

        it 'should return true' do
          expect(subject.test?(date)).to eq true
        end
      end
    end

    context 'the rule is fixed' do
      subject { described_class.new(:myrule, fixed_rule)}

      context 'when the date does not match the rule' do
        let(:date) { Time.zone.parse('11/5/2012') }

        it 'should return false' do
          expect(subject.test?(date)).to eq false
        end
      end

      context 'when the date matches the rule' do
        let(:date) { Time.zone.parse('10/05/2012') }

        it 'should return true' do
          expect(subject.test?(date)).to eq true
        end
      end
    end
  end
end
