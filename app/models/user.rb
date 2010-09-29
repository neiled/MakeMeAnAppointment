class User < ActiveRecord::Base
 acts_as_authentic 
 attr_accessor :domain_name
 belongs_to :business
 accepts_nested_attributes_for :business
end
