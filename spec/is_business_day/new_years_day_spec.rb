require 'spec_helper'

describe 'new years day' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }
  let(:date){ Date.new_years_day }
  let(:time){ Time.new_years_day }

  it 'should return the correct object types' do
    expect(date).to be_a Date
    expect(time).to be_a Time
  end

  describe Date do
    context 'Class' do
      subject{ date }

      its(:month){ should be 1 }
      its(:day){ should be 1 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_new_years_day?){ should be_true }
      its(:is_not_new_years_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      subject{ some_date.new_years_day }

      its(:month){ should be 1 }
      its(:day){ should be 1 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_new_years_day?){ should be_true }
      its(:is_not_new_years_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end

  describe Time do
    context 'Class' do
      subject{ time }

      its(:month){ should be 1 }
      its(:day){ should be 1 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_new_years_day?){ should be_true }
      its(:is_not_new_years_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      subject{ some_time.new_years_day }

      its(:month){ should be 1 }
      its(:day){ should be 1 }
      its(:year){ should be some_time.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_new_years_day?){ should be_true }
      its(:is_not_new_years_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end
end