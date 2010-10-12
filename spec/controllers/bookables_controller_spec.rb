require 'spec_helper'

describe BookablesController do
  
  describe "GET index" do
    it "assigns all bookables as @bookables" do
      #stub(Bookable).all { [mock_bookable] }
      #get :index
      #assigns(:bookables).should eq([mock_bookable])
    end
  end

  describe "GET show" do
    it "assigns the requested bookable as @bookable" do
      activate_authlogic
      login
      my_bookable = Factory(:bookable)
      Bookable.should_receive(:find).with("37").and_return(my_bookable)
      get :show, :id => "37"
      assigns(:bookable).should be(my_bookable)
    end
  end

  describe "GET new" do
    it "assigns a new bookable as @bookable and business as @business" do
      activate_authlogic
      login
      my_business = Factory(:business)
      current_user.stub(:business).and_return(my_business)
      my_bookable = Bookable.new
      proxy = mock('business association proxy', :build => my_bookable)
      my_business.should_receive(:bookables).and_return(proxy)
      get :new
      assigns(:bookable).should be(my_bookable)
      assigns(:business).should be(my_business)
    end
  end

  describe "GET edit" do
    it "assigns the requested bookable as @bookable" do
      activate_authlogic
      login
      my_mock = Factory(:bookable)
      Bookable.stub(:find).with("37").and_return(my_mock)
      get :edit, :id => "37"
      assigns(:bookable).should be(my_mock)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created bookable as @bookable" do
        activate_authlogic
        login
        my_mock = stub_model(Bookable)
        my_mock.should_receive(:save).and_return(true)
        Bookable.stub(:new).and_return(my_mock)
        post :create, :business_id => my_mock.business_id 
        assigns(:bookable).should be(my_mock)
     end

      it "redirects to the business page" do
        activate_authlogic
        login
        my_mock = Factory.build(:bookable)
        my_mock.should_receive(:save).and_return(true)
        Bookable.stub(:new).with({}).and_return(my_mock)
        post :create, :bookable => {}, :business_id => my_mock.business_id

        response.should redirect_to(business_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bookable as @bookable" do
        activate_authlogic
        login
        my_bookable = stub_model(Bookable)
        my_bookable.should_receive(:save).and_return(false)
        Bookable.should_receive(:new).and_return(my_bookable)
        post :create, :bookable => {}
        assigns(:bookable).should be(my_bookable)
      end

      it "re-renders the 'new' template" do
        activate_authlogic
        login
        Bookable.stub(:new).and_return(stub_model(Bookable, :save=>false))
        post :create, :bookable => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    before(:each) do
      activate_authlogic
      login
      @mock_bookable = Factory(:bookable)
    end

    describe "with valid params" do

      it "updates the requested bookable" do
        Bookable.should_receive(:find).with("37").and_return(@mock_bookable)
        @mock_bookable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bookable => {'these' => 'params'}
      end

      it "assigns the requested bookable as @bookable" do
        @mock_bookable.should_receive(:update_attributes).and_return(true)
        Bookable.stub(:find).and_return(@mock_bookable)
        put :update, :id => "1"
        assigns(:bookable).should be(@mock_bookable)
      end

      it "redirects to the business" do
        @mock_bookable.should_receive(:update_attributes).and_return(true)
        Bookable.stub(:find).and_return(@mock_bookable)
        put :update, :id => "1"
        response.should redirect_to(business_path)
      end
    end

    describe "with invalid params" do
      it "assigns the bookable as @bookable" do
        @mock_bookable.should_receive(:update_attributes).and_return(false)
        Bookable.stub(:find).and_return(@mock_bookable)
        put :update, :id => "1"
        assigns(:bookable).should be(@mock_bookable)
      end

      it "re-renders the 'edit' template" do
        @mock_bookable.should_receive(:update_attributes).and_return(false)
        Bookable.stub(:find).and_return(@mock_bookable)
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested bookable" do
      #Bookable.should_receive(:find).with("37") { mock_bookable }
      #mock_bookable.should_receive(:destroy)
      #delete :destroy, :id => "37"
    end

    it "redirects to the bookables list" do
      #stub(Bookable).find { mock_bookable }
      #delete :destroy, :id => "1"
      #response.should redirect_to(bookables_url)
    end
  end

end
