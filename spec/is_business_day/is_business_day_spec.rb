require 'spec_helper'

describe 'IsBusinessday' do
  let(:business_day){ Date.parse("11/12/13") }
  let(:saturday){ Date.parse("11/16/13") }
  let(:fourth_of_july){ Date.parse("07/04/13") }
  let(:friday){ Date.parse("11/15/13") }
  let(:monday){ Date.parse("11/11/13") }

  describe 'business day tests' do
    context 'valid business day' do
      subject{ business_day }
      its(:tuesday?){ should be_true }
      its(:is_a_business_day?){ should be_true }
      its(:is_not_a_business_day?){ should be_false }
      its(:next_business_day){ should == Date.parse("11/13/13") }
      its(:previous_business_day){ should == Date.parse("11/11/13") }
    end

    context 'weekend' do
      subject{ saturday }
      its(:saturday?){ should be_true }
      its(:is_a_business_day?){ should be_false }
      its(:is_not_a_business_day?){ should be_true }
      its(:next_business_day){ should == Date.parse("11/18/13") }
      its(:previous_business_day){ should == friday }
    end

    context 'friday' do
      subject{ friday }
      its(:friday?){ should be_true }
      its(:next_business_day){ should == Date.parse("11/18/13") }
      its(:previous_business_day){ should == Date.parse("11/14/13") }
    end
  end

  describe 'holiday tests' do
    context 'business day' do
      subject{ business_day }
      its(:is_a_holiday?){ should be_false }
      its(:is_not_a_holiday?){ should be_true }
    end

    context 'holiday' do
      subject{ fourth_of_july }
      its(:is_a_holiday?){ should be_true }
      its(:is_not_a_holiday?){ should be_false }
    end
  end
end