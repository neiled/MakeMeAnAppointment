require 'spec_helper'

describe UserSessionsController do
  describe "POST create" do
    describe "with valid params" do
      
      it "redirects to the user's business" do
        my_user = Factory(:user)
        post :create, :user_session => {:email => my_user.email, :password => my_user.password}

        response.should redirect_to(:controller => "businesses", :action => "show")
      end
    end

    describe "with invalid params" do
      it "renders the new action again" do
        post :create, :user_session => {:email => "test@example.com", :password => "none"}
        response.should render_template(:new)
      end
      
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
