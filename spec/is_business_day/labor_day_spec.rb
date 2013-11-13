require 'spec_helper'

describe 'labor_day' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }
  let(:date){ Date.labor_day }
  let(:time){ Time.labor_day }

  it 'should not be labor day' do
    expect(some_date.is_labor_day?).to be_false
    expect(some_time.is_labor_day?).to be_false
  end

  it 'should be proper objects' do
    expect(date).to be_a Date
    expect(time).to be_a Time
  end

  describe Date do
    context 'Class' do
      let(:september){ Date.parse("09/01/#{ date.year }") }
      let(:first_monday){ september.get_all_specific_days_in_month(:monday).first }
      subject{ date }

      its(:month){ should be 9 }
      its(:day){ should be first_monday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_labor_day?){ should be_true }
      its(:is_not_labor_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:september){ Date.parse("09/01/#{ some_date.year }")}
      let(:first_monday){ september.get_all_specific_days_in_month(:monday).first }
      subject{ some_date.labor_day }

      its(:month){ should be 9 }
      its(:day){ should be first_monday.day }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_labor_day?){ should be_true }
      its(:is_not_labor_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end

  describe Time do
    context 'Class' do
      let(:september){ Date.parse("09/01/#{ time.year }")}
      let(:first_monday){ september.get_all_specific_days_in_month(:monday).first }
      subject{ time }

      its(:month){ should be 9 }
      its(:day){ should be first_monday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_labor_day?){ should be_true }
      its(:is_not_labor_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:september){ Date.parse("09/01/#{ some_time.year }")}
      let(:first_monday){ september.get_all_specific_days_in_month(:monday).first }
      subject{ some_time.labor_day }

      its(:month){ should be 9 }
      its(:day){ should be first_monday.day }
      its(:year){ should be some_time.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_labor_day?){ should be_true }
      its(:is_not_labor_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end
end