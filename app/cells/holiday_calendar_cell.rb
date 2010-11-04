class HolidayCalendarCell < Cell::Rails
  helper :application

  DAYS_IN_A_WEEK = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  MONTHS_IN_A_YEAR = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  def display
    current_user = @opts[:current_user]
    @business_calendar = Calendar.includes(:holiday_dates).find(current_user.business.calendar.id)
    @total = @opts[:total]
    @current_year = @opts[:current_year]
    render
  end

end
