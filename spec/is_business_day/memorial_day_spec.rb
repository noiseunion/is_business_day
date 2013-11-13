require 'spec_helper'

describe 'memorial day' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }
  let(:date){ Date.memorial_day }
  let(:time){ Time.memorial_day }

  it 'should return the correct object types' do
    expect(date).to be_a Date
    expect(time).to be_a Time
  end

  describe Date do
    context 'Class' do
      let(:may){ Date.parse("05/01/#{ date.year }") }
      let(:last_monday){ may.get_all_specific_days_in_month(:monday).last }
      subject{ date }

      its(:month){ should be 5 }
      its(:day){ should be last_monday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_memorial_day?){ should be_true }
      its(:is_not_memorial_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:may){ Date.parse("05/01/#{ some_date.year }") }
      let(:last_monday){ may.get_all_specific_days_in_month(:monday).last }
      subject{ some_date.memorial_day }

      its(:month){ should be 5 }
      its(:day){ should be last_monday.day }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_memorial_day?){ should be_true }
      its(:is_not_memorial_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end

  describe Time do
    context 'Class' do
      let(:may){ Date.parse("05/01/#{ time.year }") }
      let(:last_monday){ may.get_all_specific_days_in_month(:monday).last }
      subject{ time }

      its(:month){ should be 5 }
      its(:day){ should be last_monday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_memorial_day?){ should be_true }
      its(:is_not_memorial_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:may){ Date.parse("05/01/#{ some_time.year }") }
      let(:last_monday){ may.get_all_specific_days_in_month(:monday).last }
      subject{ some_time.memorial_day }

      its(:month){ should be 5 }
      its(:day){ should be last_monday.day }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_memorial_day?){ should be_true }
      its(:is_not_memorial_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end
end