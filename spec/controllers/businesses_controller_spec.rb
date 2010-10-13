require 'spec_helper'

describe BusinessesController do

  describe "GET show" do
    it "assigns business as @businesses" do
      activate_authlogic
      login
      my_business = Factory(:business)
      current_user.should_receive(:business).and_return(my_business)
      get :show
      assigns(:business).should eq(my_business)
    end
  end

  describe "GET edit" do
    it "assigns the requested business as @business" do
      activate_authlogic
      login
      my_business = Factory(:business)
      current_user.should_receive(:business).and_return(my_business)

      get :edit, :id => "37"
      assigns(:business).should be(my_business)
    end
  end

  describe "PUT update" do

    before(:each) do
      activate_authlogic
      login
    end

    describe "with valid params" do
      it "updates the requested business" do
        current_user.business.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :business => {'these' => 'params'}
      end

      it "assigns the requested business as @business" do
        my_business = Factory(:business)
        current_user.should_receive(:business).and_return(my_business)
        my_business.should_receive(:update_attributes).and_return(true)
        put :update
        assigns(:business).should be(my_business)
      end

      it "redirects to the business" do
        current_user.business.should_receive(:update_attributes).and_return(true)
        put :update
        response.should redirect_to(edit_business_url)
      end
    end

    describe "with invalid params" do
      it "assigns the business as @business" do
        my_business = Factory(:business)
        current_user.should_receive(:business).and_return(my_business)
        my_business.should_receive(:update_attributes).and_return(false)
        put :update
        assigns(:business).should be(my_business)
      end

      it "re-renders the 'edit' template" do
        current_user.business.should_receive(:update_attributes).and_return(false)
        put :update
        response.should render_template("edit")
      end
    end

  end

end
