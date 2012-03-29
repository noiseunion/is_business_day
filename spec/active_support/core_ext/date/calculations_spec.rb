require "is_business_day"

describe Date do
    it "should know that monday is a valid business day" do
      Date.parse("26/03/2012").is_a_business_day?.should be_true
    end

    it "should know that tuesday is a valid business day" do
      Date.parse("27/03/2012").is_a_business_day?.should be_true
    end

    it "should know that wednesday is a valid business day" do
      Date.parse("28/03/2012").is_a_business_day?.should be_true
    end

    it "should know that thursday is a valid business day" do
      Date.parse("29/03/2012").is_a_business_day?.should be_true
    end

    it "should know that friday is a valid business day" do
      Date.parse("30/03/2012").is_a_business_day?.should be_true
    end

    it "should know that saturday is not a valid business day" do
      Date.parse("31/03/2012").is_not_a_business_day?.should be_true
      Date.parse("31/03/2012").is_a_business_day?.should be_false
    end

    it "should know that sunday is not a valid business day" do
      Date.parse("01/04/2012").is_not_a_business_day?.should be_true
      Date.parse("01/04/2012").is_a_business_day?.should be_false
    end

    it "should know that the next business day for a friday is monday" do
      next_business_day = Date.parse("30/03/2012").next_business_day
      next_business_day.should eql(Date.parse("02/04/2012"))
      next_business_day.monday?.should be_true
    end

    it "should know that the business day previous a monday was friday" do
      previous_business_day = Date.parse("26/03/2012").previous_business_day
      previous_business_day.should eql(Date.parse("23/03/2012"))
      previous_business_day.friday?.should be_true
    end
end