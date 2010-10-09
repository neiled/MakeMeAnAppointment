class CreateBookables < ActiveRecord::Migration
  def self.up
    create_table :bookables do |t|
      t.string :name
      t.text :description
      t.integer :business_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookables
  end
end
