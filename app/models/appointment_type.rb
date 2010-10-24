class AppointmentType < ActiveRecord::Base
  belongs_to :business

  validates_presence_of :name
  validates_presence_of :duration
  validates_uniqueness_of :name, :scope => :business_id, :case_sensitive => false
  validates_presence_of :business_id
end
