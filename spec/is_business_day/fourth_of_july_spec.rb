require 'spec_helper'

describe 'fourth_of_july' do
  let(:some_date){ Date.parse("06/06/1979") }
  let(:some_time){ Time.parse("06/06/1979 6:45pm") }
  let(:date){ Date.fourth_of_july }
  let(:time){ Time.fourth_of_july }

  it 'should not be the fourth of july' do
    expect(some_date.is_fourth_of_july?).to be_false
    expect(some_time.is_fourth_of_july?).to be_false
  end

  it 'should return the proper objects' do
    expect(date).to be_a Date
    expect(time).to be_a Time
  end

  describe Date do
    context 'Class' do
      subject{ date }

      its(:day){ should be 4 }
      its(:month){ should be 7 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_fourth_of_july?){ should be_true }
      its(:is_not_fourth_of_july?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      subject{ some_date.fourth_of_july }

      its(:day){ should be 4 }
      its(:month){ should be 7 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_fourth_of_july?){ should be_true }
      its(:is_not_fourth_of_july?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end

  describe Time do
    context 'Class' do
      subject{ time }

      its(:day){ should be 4 }
      its(:month){ should be 7 }
      its(:year){ should be Date.today.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_fourth_of_july?){ should be_true }
      its(:is_not_fourth_of_july?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end

    context 'instance' do
      subject{ some_time.fourth_of_july }

      its(:day){ should be 4 }
      its(:month){ should be 7 }
      its(:year){ should be some_date.year }
      its(:is_a_holiday?){ should be_true }
      its(:is_fourth_of_july?){ should be_true }
      its(:is_not_fourth_of_july?){ should be_false }
      its(:is_a_business_day?){ should be_false }
    end
  end
end