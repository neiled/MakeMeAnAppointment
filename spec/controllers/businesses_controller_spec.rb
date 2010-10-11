require 'spec_helper'

describe BusinessesController do
  before(:each) do
    activate_authlogic
    login
    #controller.stub(:current_user).and_return(current_user)
    
  end
  
  describe "GET show" do
    it "assigns current business as @business" do
      my_business = Factory(:business)
      current_user.should_receive(:business).and_return(my_business)
      get :show
      assigns(:business).should be(my_business)
    end
  end

end
