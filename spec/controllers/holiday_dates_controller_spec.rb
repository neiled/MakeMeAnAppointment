require 'spec_helper'

describe HolidayDatesController do

  describe "GET 'toggle_holiday'" do
    describe "with a valid date" do
      it "should set a holiday if that holiday doesn't exist" do
        activate_authlogic
        login
        my_business = current_user.business
        my_calendar = Factory(:calendar)
        my_business.calendar = my_calendar
        Calendar.should_receive(:find).and_return(my_calendar)
        post :toggle_holiday, :date => Date.new(2010,10,14), :calendar_id => my_calendar.id
        assert Calendar.has_a_holiday_on(Date.new(2010,10,14), my_calendar.holiday_dates)
      end

      it "should delete a holiday if that holiday exists" do
        activate_authlogic
        login
        my_business = current_user.business
        my_calendar = Factory(:calendar)
        my_business.calendar = my_calendar
        my_calendar.holiday_dates.create(:date => Date.new(2010,10,14))
        Calendar.should_receive(:find).and_return(my_calendar)
        post :toggle_holiday, :date => Date.new(2010,10,14), :calendar_id => my_calendar.id
        assert !Calendar.has_a_holiday_on(Date.new(2010,10,14), my_calendar.holiday_dates)
      end
    end
  end

end
