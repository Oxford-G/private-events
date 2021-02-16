module EventsHelper
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :date, :user_id)
  end

  def creator?
    set_event
    return if current_user.id == @event.user_id

    flash[:alert] = 'Unauthorized request'
    redirect_to root_path
  end
end
