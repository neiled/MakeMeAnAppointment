module ApplicationHelper

  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  def calendar_row(m, current_year, calendar)
    start_date = Time.utc(current_year, m, 1)
    output = "<td>" + start_date.strftime("%b") + "</td>"
    current_month = start_date.month
    start_date.wday.to_i.times do
      output += "<td></td>"
    end

    (1..31).each do |d|
     current_time = Time.utc(@current_year, m, d)
     if current_time.month == current_month
       dim = days_in_month(current_time.month, current_time.year)
       if d <= dim
        output += "<td class=\"" + get_calendar_cell_class(current_time, calendar) + "\">"
        output += link_to current_time.day.to_s, "add_holiday"
        output += "</td>"
       end
     end
    end

    output
  end # calendar_row

  def get_calendar_cell_class(current_time, calendar)
    if calendar.has_a_holiday_on(current_time)
      "holiday"
    else
      "no_holiday"
    end

  end # get_calendar_cell_class(current_time, calendar)
  
  

end
