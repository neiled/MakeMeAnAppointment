require 'spec_helper'

describe AppointmentTypesController do

  before(:each) do
    activate_authlogic
    login
    @my_business = Factory(:business)
    current_user.stub(:business).and_return(@my_business)
  end

  describe "GET new" do
    it "should create a new appointment type for the current users business" do
      my_appointment_type = AppointmentType.new
      proxy = mock('business association proxy', :build => my_appointment_type)
      @my_business.should_receive(:appointment_types).and_return(proxy)

      get :new
      assigns(:appointment_type).should be(my_appointment_type)
      
    end
    
  end

  describe "POST create" do
    describe "with valid params" do
      it "should create the new appointment type" do
        my_at = stub_model(AppointmentType) 
        my_at.should_receive(:save).and_return(true)
        AppointmentType.should_receive(:new).and_return(my_at)
        post :create, :appointment_type => {:business_id => my_at.business_id}
      end
      
    end
  end

end
