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
  
  describe "GET edit" do
    it "should assign the selected appointment type" do
      my_mock = Factory(:appointment_type, :business => current_user.business)
      current_user.business.appointment_types.should_receive(:find).with("37") {my_mock}
      get :edit, :id => "37"
      assigns(:appointment_type).should be(my_mock)
    end
  end

  describe "PUT update" do
    before(:each) do
      @appointment_type = Factory(:appointment_type, \
                                  :business_id => current_user.business.id)
      current_user.business.appointment_types.\
        should_receive(:find).with("37") {@appointment_type}
    end

    describe "with valid params" do
      it "should update the appointment type" do
        @appointment_type.should_receive(:update_attributes).\
          with({'these' => 'params'})

        put :update, :id => "37", :appointment_type => {'these' => 'params'}
      end

      it "should redirect back to the business" do
        @appointment_type.should_receive(:update_attributes).and_return(true)

        put :update, :id => "37"
        response.should redirect_to(edit_business_path)
      end
    end

    describe "with invalid params" do
      it "should assign appointment type" do
        @appointment_type.should_receive(:update_attributes).and_return(false)
        put :update, :id => "37"

        assigns(:appointment_type).should be(@appointment_type)
      end  

      it "should rerender the new action" do
        @appointment_type.should_receive(:update_attributes).and_return(false)
        put :update, :id => "37"

        response.should render_template(:edit) 
      end
    end
  end

  describe "DELETE destroy" do

     before(:each) do
      @appointment_type = Factory(:appointment_type, \
                                  :business_id => current_user.business.id)
    end

    it "deletes the requested appointment type" do
      current_user.business.appointment_types.\
        should_receive(:find).with("37") {@appointment_type}
      @appointment_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
    
  end

end
