module InvitationsHelper
  def invitation_params
    params.require(:invitation).permit(:user, :event, :user_id, :event_id)
  end
end
