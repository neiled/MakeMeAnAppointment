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
      #stub(Bookable).find("37") { mock_bookable }
      #get :show, :id => "37"
      #assigns(:bookable).should be(mock_bookable)
    end
  end

  describe "GET new" do
    it "assigns a new bookable as @bookable" do
      #stub(Bookable).new { mock_bookable }
      #get :new
      #assigns(:bookable).should be(mock_bookable)
    end
  end

  describe "GET edit" do
    it "assigns the requested bookable as @bookable" do
      #stub(Bookable).find("37") { mock_bookable }
      #get :edit, :id => "37"
      #assigns(:bookable).should be(mock_bookable)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created bookable as @bookable" do
        mock(my_mock = Factory(:bookable)).save {true}
        stub(Bookable).new {my_mock}
        post :create, :business_id => my_mock.business_id 
        assigns(:bookable).should be(my_mock)
     end

      it "redirects to the business page" do
        mock(my_mock = Factory.build(:bookable)).save {true}
        stub(Bookable).new({}) { my_mock }
        post :create, :bookable => {}, :business_id => my_mock.business_id

        response.should redirect_to(:controller => "businesses", :action => "show", :id => my_mock.business)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bookable as @bookable" do
        #stub(Bookable).new({'these' => 'params'}) { mock_bookable(:save => false) }
        #post :create, :bookable => {'these' => 'params'}
        #assigns(:bookable).should be(mock_bookable)
      end

      it "re-renders the 'new' template" do
        #stub(Bookable).new { mock_bookable(:save => false) }
        #post :create, :bookable => {}
        #response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested bookable" do
        #Bookable.should_receive(:find).with("37") { mock_bookable }
        #mock_bookable.should_receive(:update_attributes).with({'these' => 'params'})
        #put :update, :id => "37", :bookable => {'these' => 'params'}
      end

      it "assigns the requested bookable as @bookable" do
        #stub(Bookable).find { mock_bookable(:update_attributes => true) }
        #put :update, :id => "1"
        #assigns(:bookable).should be(mock_bookable)
      end

      it "redirects to the bookable" do
        #stub(Bookable).find { mock_bookable(:update_attributes => true) }
        #put :update, :id => "1"
        #response.should redirect_to(bookable_url(mock_bookable))
      end
    end

    describe "with invalid params" do
      it "assigns the bookable as @bookable" do
        #stub(Bookable).find { mock_bookable(:update_attributes => false) }
        #put :update, :id => "1"
        #assigns(:bookable).should be(mock_bookable)
      end

      it "re-renders the 'edit' template" do
        #stub(Bookable).find { mock_bookable(:update_attributes => false) }
        #put :update, :id => "1"
        #response.should render_template("edit")
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
