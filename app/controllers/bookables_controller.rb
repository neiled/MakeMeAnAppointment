class BookablesController < ApplicationController
  before_filter :require_user

  def show
    @bookable = current_user.business.bookables.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @business = current_user.business
    @bookable = @business.bookables.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @bookable = current_user.business.bookables.find(params[:id])
  end

  def create
    @business = current_user.business
    @bookable = Bookable.new(params[:bookable])

    respond_to do |format|
      if @bookable.save
        format.html {
          redirect_to(edit_business_path, :notice => 'Bookable was successfully created.') 
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @bookable = current_user.business.bookables.find(params[:id])

    respond_to do |format|
      if @bookable.update_attributes(params[:bookable])
        format.html {
          redirect_to(edit_business_path, :notice => 'Bookable was successfully updated.') 
        }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @bookable = current_user.business.bookables.find(params[:id])
    @bookable.destroy

    respond_to do |format|
      format.html { redirect_to(edit_business_url) }
    end
  end
end
