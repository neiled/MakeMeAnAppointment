class AddCalendarIdToBookables < ActiveRecord::Migration
  def self.up
    add_column :bookables, :calendar_id, :integer
  end

  def self.down
    remove_column :bookables, :calendar_id
  end
end
