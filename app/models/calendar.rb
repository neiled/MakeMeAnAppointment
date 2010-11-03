class Calendar < ActiveRecord::Base
  has_one :business
  has_many :holiday_dates

  def has_a_holiday_on(date)
    holiday_dates.find_by_date(date)
  end # has_a_holiday_on(date)
  
end
