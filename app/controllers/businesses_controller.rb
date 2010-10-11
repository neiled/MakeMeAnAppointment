class BusinessesController < ApplicationController
  before_filter :require_user

 def show
    @business = current_user.business
  end # show

  def edit
    @business = current_user.business
  end # edit
  
 
end
