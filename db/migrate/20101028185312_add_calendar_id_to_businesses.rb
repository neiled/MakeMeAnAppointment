class AddCalendarIdToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :calendar_id, :integer
  end

  def self.down
    remove_column :businesses, :calendar_id
  end
end
