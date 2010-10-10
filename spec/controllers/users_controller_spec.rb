require 'spec_helper'

describe UsersController do
  it "should assign a new user and business" do
    get :new
    should assign_to(:user)
    should assign_to(:business)
    should_not set_the_flash
    assigns[:user].should be_new_record
    assert_equal assigns[:business], assigns[:user].business
  end

  it "should redirect after creation" do
    user = Factory(:user)
    mock(User).new({}) {user}
    mock(user).save {true}
    post :create, :user => {} 
    should set_the_flash
    response.should redirect_to(businesses_url)
  end
end
