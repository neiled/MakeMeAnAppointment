class BookablesController < ApplicationController
  def index
    @bookables = Bookable.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @bookable = Bookable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @business = Business.find(params[:business_id])
    @bookable = @business.bookables.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @bookable = Bookable.find(params[:id])
  end

  def create
    @business = Business.find(params[:business_id])
    @bookable = Bookable.new(params[:bookable])

    respond_to do |format|
      if @bookable.save
        format.html {
          redirect_to(@bookable.business, :notice => 'Bookable was successfully created.') 
        }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @bookable = Bookable.find(params[:id])

    respond_to do |format|
      if @bookable.update_attributes(params[:bookable])
        format.html {
          redirect_to(@bookable.business, :notice => 'Bookable was successfully updated.') 
        }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @bookable = Bookable.find(params[:id])
    @bookable.destroy

    respond_to do |format|
      format.html { redirect_to(bookables_url) }
    end
  end
end
