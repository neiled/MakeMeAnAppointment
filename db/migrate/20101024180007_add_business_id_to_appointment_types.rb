class AddBusinessIdToAppointmentTypes < ActiveRecord::Migration
  def self.up
    add_column :appointment_types, :business_id, :integer
  end

  def self.down
    remove_column :appointment_types, :business_id
  end
end
