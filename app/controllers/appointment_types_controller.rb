class AppointmentTypesController < ApplicationController

  before_filter :require_user

  def new
    @appointment_type = current_user.business.appointment_types.build 
  end # new
  
  def create
    @appointment_type = AppointmentType.new(params[:appointment_type])
    if @appointment_type.save
      redirect_to(edit_business_path, :notice => 'Appointment type was successfully created.') 
    else
      render :action => :new
    end
  end # create

  def edit
    @appointment_type = current_user.business.appointment_types.find(params[:id])
  end # edit

  def update
    @appointment_type = current_user.business.appointment_types.find(params[:id])
    if @appointment_type.update_attributes(params[:appointment_type])
      redirect_to edit_business_path, :notice => "Appointment type was updated" 
    else
      render :action => :edit
    end
  end # update
  
end
