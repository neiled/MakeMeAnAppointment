class UsersController < ApplicationController
  
  before_filter :require_signed_in_user, :only => [:edit, :update]
  before_filter :require_user, :except => [:new, :create, :edit, :update]
  
  def new
    @user = User.new
    @business = @user.build_business
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to business_path, :notice => "Account Registered"
    else
      render :action => "new"
    end
  end
  
  def destroy
  end
  
end

