require 'spec_helper'

describe UserSessionsController do
  describe "POST create" do
    it "redirects to the user's business" do
      pending
      activate_authlogic
      #session = mock(UserSession)
      #user = mock(User)
      #business = mock(Business)
      #UserSession.stub(:new).and_return(session)
      #UserSession.stub(:user).and_return(user)
      #User.stub(:business).and_return(business)
      UserSession.mock(:save).and_return(true)
      
      post :create
      response.should redirect_to(:controller => "business", :action => "show")
    end
  end
  describe "a POST to #destroy" do 
    it "sets the flash" do
      post :destroy
      should set_the_flash
    end
    it "destroys the user session" do
      controller.stub(:current_user).and_return(User.new)
      my_object = UserSession.new
      my_object.should_receive(:destroy)
      controller.stub(:current_user_session).and_return(my_object)
      post :destroy 
    end
  end 
end
