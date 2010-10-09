class Bookable < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :business_id
  belongs_to :business
end
