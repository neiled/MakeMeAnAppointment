class CreateWorkDays < ActiveRecord::Migration
  def self.up
    create_table :work_days do |t|
      t.integer :calendar_id
      t.integer :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :work_days
  end
end
