class AddLatAndLongToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :latitude, :float
    add_column :businesses, :longitude, :float
  end

  def self.down
    remove_column :businesses, :longitude
    remove_column :businesses, :latitude
  end
end
