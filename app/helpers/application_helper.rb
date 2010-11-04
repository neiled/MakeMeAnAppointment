module ApplicationHelper

  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  #we're going to use total just so we know the max row length
  def calendar_row(m, current_year, calendar, total)
    start_date = Date.new(current_year, m, 1)
    output = "<td>" + start_date.strftime("%b") + "</td>"
    current_month = start_date.month
    start_date.wday.to_i.times do
      output += "<td></td>"
    end

    #subtract how many we started with
    total -= start_date.wday.to_i

    dim = days_in_month(start_date.month, start_date.year)
    (1..dim).each do |d|
     current_time = Date.new(current_year, m, d)
     if current_time.month == current_month
       if d <= dim
        output += "<td class=\"" + get_calendar_cell_class(current_time, calendar) + "\">"
        output += link_to current_time.day.to_s, "add_holiday"
        output += "</td>"
        total -= 1
       end
     end
    end

    #print out the rest of the row
    total.times do
      output += "<td></td>"
    end


    output
  end # calendar_row

  def get_calendar_cell_class(current_time, calendar)
    if Calendar.has_a_holiday_on(current_time, calendar.holiday_dates)
      "holiday"
    else
      "no_holiday"
    end

  end # get_calendar_cell_class(current_time, calendar)
  
  

end
