class CreateAppointmentTypes < ActiveRecord::Migration
  def self.up
    create_table :appointment_types do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 19, :scale => 4
      t.integer :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :appointment_types
  end
end
