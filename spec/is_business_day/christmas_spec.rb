require 'spec_helper'

describe 'christmas' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }

  it 'should not return true when testing the some_date' do
    expect(some_date.is_xmas_eve?).to be_false
    expect(some_date.is_xmas_day?).to be_false
    expect(some_time.is_xmas_eve?).to be_false
    expect(some_time.is_xmas_day?).to be_false
  end

  describe 'christmas eve' do
    context 'Date Class' do
      subject{ Date.christmas_eve }

      its(:day){ should be 24 }
      its(:month){ should be 12 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_eve?){ should be_true }
      its(:is_xmas_eve?){ should be_true }

      it 'should be a Date object' do
        expect(subject).to be_a Date
      end
    end

    context 'Time Class' do
      subject{ Time.christmas_eve }

      its(:day){ should be 24 }
      its(:month){ should be 12 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_eve?){ should be_true }
      its(:is_xmas_eve?){ should be_true }

      it 'should be a Date object' do
        expect(subject).to be_a Time
      end
    end

    context 'Date instance' do
      subject{ some_date.christmas_eve }

      its(:day){ should be 24 }
      its(:month){ should be 12 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_eve?){ should be_true }
      its(:is_xmas_eve?){ should be_true }
      its(:is_not_christmas_eve?){ should be_false }
      its(:is_not_xmas_eve?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Date
      end
    end

    context 'Time instance' do
      subject{ some_time.christmas_eve }

      its(:day){ should be 24 }
      its(:month){ should be 12 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_eve?){ should be_true }
      its(:is_xmas_eve?){ should be_true }
      its(:is_not_christmas_eve?){ should be_false }
      its(:is_not_xmas_eve?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Time
      end
    end
  end

  describe 'christmas day' do
    context 'Date Class' do
      subject{ Date.christmas_day }

      its(:day){ should be 25 }
      its(:month){ should be 12 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_day?){ should be_true }
      its(:is_xmas_day?){ should be_true }
      its(:is_not_christmas_day?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Date
      end
    end

    context 'Time Class' do
      subject{ Time.christmas_day }

      its(:day){ should be 25 }
      its(:month){ should be 12 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_day?){ should be_true }
      its(:is_xmas_day?){ should be_true }
      its(:is_not_christmas_day?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Time
      end
    end

    context 'a date instance' do
      subject{ some_date.christmas_day }

      its(:day){ should be 25 }
      its(:month){ should be 12 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_day?){ should be_true }
      its(:is_xmas_day?){ should be_true }
      its(:is_not_christmas_day?){ should be_false }
      its(:is_not_xmas_day?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Date
      end
    end

    context 'a time instance' do
      subject{ some_time.christmas_day }

      its(:day){ should be 25 }
      its(:month){ should be 12 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_christmas_day?){ should be_true }
      its(:is_xmas_day?){ should be_true }
      its(:is_not_christmas_day?){ should be_false }
      its(:is_not_xmas_day?){ should be_false }

      it 'should be a Date object' do
        expect(subject).to be_a Time
      end
    end
  end
end