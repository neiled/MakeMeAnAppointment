class AddAddressToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :website, :string
    add_column :businesses, :address, :text
    add_column :businesses, :phone_main, :string
    add_column :businesses, :phone_other, :string
  end

  def self.down
    remove_column :businesses, :phone_other
    remove_column :businesses, :phone_main
    remove_column :businesses, :address
    remove_column :businesses, :website
  end
end
