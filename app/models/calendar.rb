class Calendar < ActiveRecord::Base
  has_one :business
  has_many :holiday_dates

  def self.has_a_holiday_on(date, holiday_dates)
    holiday_dates.each do |d|
      if d.date <= date and d.end_date >= date
        return true
      end
    end
    false
  end # self.has_a_holiday_on(date)
  

  
end
