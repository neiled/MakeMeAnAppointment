class AddBusinessIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :business_id, :integer
  end

  def self.down
    remove_column :users, :business_id
  end
end
