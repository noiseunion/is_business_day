require 'spec_helper'

describe 'thanksgiving day' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }
  let(:date){ Date.thanksgiving_day }
  let(:time){ Time.thanksgiving_day }

  it 'should return the correct object types' do
    expect(date).to be_a Date
    expect(time).to be_a Time
  end

  describe Date do
    context 'Class' do
      let(:november){ Date.parse("11/01/#{ date.year }") }
      let(:last_thursday){ november.get_all_specific_days_in_month(:thursday).last }
      subject{ date }

      its(:month){ should be 11 }
      its(:day){ should be last_thursday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_thanksgiving_day?){ should be_true }
      its(:is_not_thanksgiving_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:november){ Date.parse("11/01/#{ some_date.year }") }
      let(:last_thursday){ november.get_all_specific_days_in_month(:thursday).last }
      subject{ some_date.thanksgiving_day }

      its(:month){ should be 11 }
      its(:day){ should be last_thursday.day }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_thanksgiving_day?){ should be_true }
      its(:is_not_thanksgiving_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end

  describe Time do
    context 'Class' do
      let(:november){ Date.parse("11/01/#{ time.year }") }
      let(:last_thursday){ november.get_all_specific_days_in_month(:thursday).last }
      subject{ time }

      its(:month){ should be 11 }
      its(:day){ should be last_thursday.day }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_thanksgiving_day?){ should be_true }
      its(:is_not_thanksgiving_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      let(:november){ Date.parse("11/01/#{ some_time.year }") }
      let(:last_thursday){ november.get_all_specific_days_in_month(:thursday).last }
      subject{ some_time.thanksgiving_day }

      its(:month){ should be 11 }
      its(:day){ should be last_thursday.day }
      its(:year){ should be some_time.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_thanksgiving_day?){ should be_true }
      its(:is_not_thanksgiving_day?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end
end