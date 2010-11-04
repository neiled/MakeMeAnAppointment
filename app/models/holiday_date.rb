class HolidayDate < ActiveRecord::Base
  belongs_to :calendar
  before_save :set_end_date

  def set_end_date
    self.end_date ||= self.date
  end # set_end_date
  
end
