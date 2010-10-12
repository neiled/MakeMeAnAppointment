require 'spec_helper'

describe UsersController do
  describe "GET new" do

    it "should assign a new user and business" do
      get :new
      should assign_to(:user)
      should assign_to(:business)
      should_not set_the_flash
      assigns[:user].should be_new_record
      assert_equal assigns[:business], assigns[:user].business
    end
   
  end

  describe "POST create" do
    
    describe "with valid params" do

      it "should redirect after creation" do
        user = Factory(:user)
        User.should_receive(:new).and_return(user)
        user.should_receive(:save).and_return(true)
        post :create, :user => {} 
        should set_the_flash
        response.should redirect_to(business_url)
      end
      
    end

    describe "with invalid params" do

      it "re-renders the new template" do
        mock_user = Factory(:user)
        mock_user.should_receive(:save).and_return(false)
        User.should_receive(:new).with({}).and_return(mock_user)
        post :create, :user => {}
        response.should render_template("new")
      end
      
    end
  end
end
