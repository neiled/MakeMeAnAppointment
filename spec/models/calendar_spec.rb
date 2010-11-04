require 'spec_helper'

describe Calendar do
  describe "determining if it has a holiday on a specific date" do
    it "can find the holiday if there is one holiday date" do
      time = Time.utc(2010, 10, 14)
      my_calendar = Factory(:calendar)
      my_holiday_date = Factory(:holiday_date, :calendar => my_calendar, :date => time, :end_date => time)
      assert my_calendar.has_a_holiday_on(time)
    end

    it "returns false when there is no holiday on that date" do
     my_calendar = Factory(:calendar)
     assert !my_calendar.has_a_holiday_on(Time.utc(2010,10,14))
    end

    it "can determine a holiday between start and end dates" do
      my_calendar = Factory(:calendar)
      my_holiday_date = Factory(:holiday_date, :calendar => my_calendar, :date => Time.utc(2010, 10, 14), :end_date => Time.utc(2010, 10, 30))
      assert my_calendar.has_a_holiday_on(Time.utc(2010,10,17))
    end
    
    it "can determine when a holiday is not between start and end dates" do
      my_calendar = Factory(:calendar)
      my_holiday_date = Factory(:holiday_date, :calendar => my_calendar, :date => Time.utc(2010, 10, 14), :end_date => Time.utc(2010, 10, 30))
      assert !my_calendar.has_a_holiday_on(Time.utc(2010,11,17))
    end
  end
end
