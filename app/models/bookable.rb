class Bookable < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :business_id
  validates_uniqueness_of :name, :scope => :business_id, :case_sensitive => false
  belongs_to :business
end
