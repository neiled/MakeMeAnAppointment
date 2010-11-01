class AddStartAndEndDatesToHolidayDates < ActiveRecord::Migration
  def self.up
    add_column :holiday_dates, :start_time, :time
    add_column :holiday_dates, :end_time, :time
  end

  def self.down
    remove_column :holiday_dates, :start_time
    remove_column :holiday_dates, :end_time
  end
end
