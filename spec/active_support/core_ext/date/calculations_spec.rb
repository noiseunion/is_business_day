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

    it "should know when labor day is" do
      test_date = Date.parse("06/06/2012")
      test_date.labor_day_this_year.should eql(Date.parse("03/09/2012"))
    end

    it "should know when memorial day is" do
      test_date = Date.parse("06/06/2012")
      test_date.memorial_day_this_year.should eql(Date.parse("28/05/2012"))
    end

    it "should know when thanksgiving is" do
      test_date = Date.parse("06/06/2012")
      test_date.thanksgiving_day_this_year.should eql(Date.parse("22/11/2012"))
    end

    it "should be able to tell if it is memorial day and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("28/05/2012")
      bad_date.is_memorial_day?.should be_false
      bad_date.is_not_memorial_day?.should be_true
      good_date.is_memorial_day?.should be_true
      good_date.is_not_memorial_day?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is labor day and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("03/09/2012")
      bad_date.is_labor_day?.should be_false
      bad_date.is_not_labor_day?.should be_true
      good_date.is_labor_day?.should be_true
      good_date.is_not_labor_day?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is thanksgiving day and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("22/11/2012")
      bad_date.is_thanksgiving_day?.should be_false
      bad_date.is_not_thanksgiving_day?.should be_true
      good_date.is_thanksgiving_day?.should be_true
      good_date.is_not_thanksgiving_day?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is xmas day and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("25/12/2012")
      bad_date.is_christmas_day?.should be_false
      bad_date.is_not_christmas_day?.should be_true
      good_date.is_christmas_day?.should be_true
      good_date.is_not_christmas_day?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is xmas eve and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("24/12/2012")
      bad_date.is_christmas_eve?.should be_false
      bad_date.is_not_christmas_eve?.should be_true
      good_date.is_christmas_eve?.should be_true
      good_date.is_not_christmas_eve?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is new year's day and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("01/01/2012")
      bad_date.is_new_years_day?.should be_false
      bad_date.is_not_new_years_day?.should be_true
      good_date.is_new_years_day?.should be_true
      good_date.is_not_new_years_day?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is the fourth of july and that it is not a valid business day" do
      bad_date  = Date.parse("06/06/2012")
      good_date = Date.parse("04/07/2012")
      bad_date.is_fourth_of_july?.should be_false
      bad_date.is_not_fourth_of_july?.should be_true
      good_date.is_fourth_of_july?.should be_true
      good_date.is_not_fourth_of_july?.should be_false
      good_date.is_not_a_business_day?.should be_true
      good_date.is_a_business_day?.should be_false
    end

    it "should be able to tell if it is a holiday or not" do
      new_years_day     = Date.parse("01/01/2012")
      memorial_day      = Date.parse("28/05/2012")
      fourth_of_july    = Date.parse("04/07/2012")
      labor_day         = Date.parse("03/09/2012")
      thanksgiving_day  = Date.parse("22/11/2012")
      xmas_eve          = Date.parse("24/12/2012")
      xmas_day          = Date.parse("25/12/2012")
      bad_date          = Date.parse("06/06/2012")

      new_years_day.is_a_holiday?.should be_true
      new_years_day.is_not_a_holiday?.should be_false
      memorial_day.is_a_holiday?.should be_true
      memorial_day.is_not_a_holiday?.should be_false
      fourth_of_july.is_a_holiday?.should be_true
      fourth_of_july.is_not_a_holiday?.should be_false
      labor_day.is_a_holiday?.should be_true
      labor_day.is_not_a_holiday?.should be_false
      thanksgiving_day.is_a_holiday?.should be_true
      thanksgiving_day.is_not_a_holiday?.should be_false
      xmas_eve.is_a_holiday?.should be_true
      xmas_eve.is_not_a_holiday?.should be_false
      xmas_day.is_a_holiday?.should be_true
      xmas_day.is_not_a_holiday?.should be_false
      bad_date.is_a_holiday?.should be_false
      bad_date.is_not_a_holiday?.should be_true
    end
end