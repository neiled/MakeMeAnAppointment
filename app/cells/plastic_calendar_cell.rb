class PlasticCalendarCell < Cell::Rails
  def display
    current_user = @opts[:current_user]
    @bookables = current_user.business.bookables
    render
  end
end
