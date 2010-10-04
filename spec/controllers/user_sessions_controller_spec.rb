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
      mock(UserSession).save {true}
      
      
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
      stub(@controller).current_user {User.new} 
      mock(my_object = UserSession.new).destroy 
      stub(@controller).current_user_session {my_object} 
      #mock(UserSession).destroy
      post :destroy 
    end
  end 
end
