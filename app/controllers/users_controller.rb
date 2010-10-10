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
  
  def show
    @user = User.find_by_login(params[:login])
    if @user
      @user_status = @user.user_status    
    else
      flash[:notice] = "The user #{params[:login]}does not exist"
      redirect_to profile_path(:login => current_user.login)
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Details Updated"
      redirect_to(profile_path(current_user.login))
    else
      render :action => "edit"
    end    
    
  end
  
 
end

