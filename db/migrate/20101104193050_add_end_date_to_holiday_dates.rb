class AddEndDateToHolidayDates < ActiveRecord::Migration
  def self.up
    add_column :holiday_dates, :end_date, :date
  end

  def self.down
    remove_column :holiday_dates, :end_date
  end
end
