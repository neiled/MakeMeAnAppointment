require 'spec_helper'

describe AppointmentType, 'valid' do
  before(:each) { @factory = Factory(:appointment_type) }
  specify { @factory.should be_valid }
  it { should validate_presence_of :name }
  it { should validate_presence_of :duration }
  it { should validate_uniqueness_of(:name).scoped_to(:business_id).case_insensitive }
  it {should validate_presence_of :business_id }
end

