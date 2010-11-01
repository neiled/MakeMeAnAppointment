class CreateHolidayDates < ActiveRecord::Migration
  def self.up
    create_table :holiday_dates do |t|
      t.integer :calendar_id
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :holiday_dates
  end
end
