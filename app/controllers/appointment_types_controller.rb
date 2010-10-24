class AppointmentTypesController < ApplicationController

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
  
  
end
