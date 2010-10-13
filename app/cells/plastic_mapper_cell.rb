class PlasticMapperCell < Cell::Rails

  def show
    @business = @opts[:business]
    render unless @business.address.nil?
  end

end
