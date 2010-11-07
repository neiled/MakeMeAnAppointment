class HolidayDatesController < ApplicationController
  def toggle_holiday
    date = params[:date]
    calendar = Calendar.find(params[:calendar_id])
    holiday_date = calendar.holiday_dates.find_by_date(date)
    unless holiday_date
      calendar.holiday_dates.create(:date => date)
    else
      holiday_date.destroy
      #todo figure out why I need this line, it works in the app but the test
      #fails without it
      calendar.holiday_dates.delete(holiday_date)
    end
    redirect_to business_calendar_path

  end

end
