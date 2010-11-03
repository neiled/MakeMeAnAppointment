class Business < ActiveRecord::Base
  has_many :bookables
  has_many :appointment_types
  belongs_to :calendar
  geocoded_by :location
  after_validation :fetch_coordinates

  def location
    address.gsub(/[\n]/, ',').gsub(/\s+/," ") unless address.nil?
  end # lo

  def after_create
    self.calendar = Calendar.create
  end # after_create
  
  
end
