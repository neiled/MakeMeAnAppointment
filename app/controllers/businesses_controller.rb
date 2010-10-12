class BusinessesController < ApplicationController
  before_filter :require_user

  # GET /businesses
  # GET /businesses.xml
  def show
    @business = current_user.business

    respond_to do |format|
      format.html # index.html.erb
    end
  end

   # GET /businesses/1/edit
  def edit
    @business = current_user.business
  end

  # PUT /businesses/1
  # PUT /businesses/1.xml
  def update
    @business = current_user.business

    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to(edit_business_url, :notice => 'Business was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end
