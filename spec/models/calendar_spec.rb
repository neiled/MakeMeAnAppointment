require 'spec_helper'

describe Calendar do
  describe "determining if it has a holiday on a specific date" do
    it "can find the holiday if there is one holiday date" do
     my_calendar = Factory(:calendar)
     my_holiday_date = Factory(:holiday_date, :calendar => my_calendar, :date => Time.utc(2010, 10, 14))
     assert my_calendar.has_a_holiday_on(Time.utc(2010,10,14))

    end

    it "returns false when there is no holiday on that date" do
      
     my_calendar = Factory(:calendar)
     assert !my_calendar.has_a_holiday_on(Time.utc(2010,10,14))
    end
  end
end
