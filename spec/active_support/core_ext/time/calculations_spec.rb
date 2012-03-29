require "is_business_day"

describe Time do
    it "should know that monday is a valid business day" do
      Time.parse("26/03/2012").is_a_business_day?.should be_true
    end

    it "should know that tuesday is a valid business day" do
      Time.parse("27/03/2012").is_a_business_day?.should be_true
    end

    it "should know that wednesday is a valid business day" do
      Time.parse("28/03/2012").is_a_business_day?.should be_true
    end

    it "should know that thursday is a valid business day" do
      Time.parse("29/03/2012").is_a_business_day?.should be_true
    end

    it "should know that friday is a valid business day" do
      Time.parse("30/03/2012").is_a_business_day?.should be_true
    end

    it "should know that saturday is not a valid business day" do
      Time.parse("31/03/2012").is_not_a_business_day?.should be_true
      Time.parse("31/03/2012").is_a_business_day?.should be_false
    end

    it "should know that sunday is not a valid business day" do
      Time.parse("01/04/2012").is_not_a_business_day?.should be_true
      Time.parse("01/04/2012").is_a_business_day?.should be_false
    end

    it "should know that the next business day for a friday is monday" do
      next_business_day = Time.parse("30/03/2012").next_business_day
      next_business_day.should eql(Time.parse("02/04/2012"))
      next_business_day.monday?.should be_true
    end

    it "should know that the business day previous a monday was friday" do
      previous_business_day = Time.parse("26/03/2012").previous_business_day
      previous_business_day.should eql(Time.parse("23/03/2012"))
      previous_business_day.friday?.should be_true
    end

    it "should know when labor day is" do
      test_time = Time.parse("06/06/2012")
      test_time.labor_day_this_year.should eql(Time.parse("03/09/2012"))
    end

    it "should know when memorial day is" do
      test_time = Time.parse("06/06/2012")
      test_time.memorial_day_this_year.should eql(Time.parse("28/05/2012"))
    end

    it "should know when thanksgiving is" do
      test_time = Time.parse("06/06/2012")
      test_time.thanksgiving_day_this_year.should eql(Time.parse("22/11/2012"))
    end

    it "should be able to tell if it is memorial day" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("28/05/2012")
      bad_date.is_memorial_day?.should be_false
      bad_date.is_not_memorial_day?.should be_true
      good_date.is_memorial_day?.should be_true
      good_date.is_not_memorial_day?.should be_false
    end

    it "should be able to tell if it is labor day" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("03/09/2012")
      bad_date.is_labor_day?.should be_false
      bad_date.is_not_labor_day?.should be_true
      good_date.is_labor_day?.should be_true
      good_date.is_not_labor_day?.should be_false
    end

    it "should be able to tell if it is thanksgiving day" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("22/11/2012")
      bad_date.is_thanksgiving_day?.should be_false
      bad_date.is_not_thanksgiving_day?.should be_true
      good_date.is_thanksgiving_day?.should be_true
      good_date.is_not_thanksgiving_day?.should be_false
    end

    it "should be able to tell if it is xmas day" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("25/12/2012")
      bad_date.is_christmas_day?.should be_false
      bad_date.is_not_christmas_day?.should be_true
      good_date.is_christmas_day?.should be_true
      good_date.is_not_christmas_day?.should be_false
    end

    it "should be able to tell if it is xmas eve" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("24/12/2012")
      bad_date.is_christmas_eve?.should be_false
      bad_date.is_not_christmas_eve?.should be_true
      good_date.is_christmas_eve?.should be_true
      good_date.is_not_christmas_eve?.should be_false
    end

    it "should be able to tell if it is new year's day" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("01/01/2012")
      bad_date.is_new_years_day?.should be_false
      bad_date.is_not_new_years_day?.should be_true
      good_date.is_new_years_day?.should be_true
      good_date.is_not_new_years_day?.should be_false
    end

    it "should be able to tell if it is the fourth of july" do
      bad_date  = Time.parse("06/06/2012")
      good_date = Time.parse("04/07/2012")
      bad_date.is_fourth_of_july?.should be_false
      bad_date.is_not_fourth_of_july?.should be_true
      good_date.is_fourth_of_july?.should be_true
      good_date.is_not_fourth_of_july?.should be_false
    end

    it "should be able to tell if it is a holiday or not" do
      new_years_day     = Time.parse("01/01/2012")
      memorial_day      = Time.parse("28/05/2012")
      fourth_of_july    = Time.parse("04/07/2012")
      labor_day         = Time.parse("03/09/2012")
      thanksgiving_day  = Time.parse("22/11/2012")
      xmas_eve          = Time.parse("24/12/2012")
      xmas_day          = Time.parse("25/12/2012")
      bad_date          = Time.parse("06/06/2012")

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