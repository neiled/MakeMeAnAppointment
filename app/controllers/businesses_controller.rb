class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id]) 
  end
end
