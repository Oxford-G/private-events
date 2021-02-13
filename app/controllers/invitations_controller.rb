class InvitationsController < ApplicationController
  include InvitationsHelper
  def new
    @invite = Invitation.new
  end

  def create
    @invite = Invitation.create(invitation_params)
    if @invite.save
      redirect_to event_path(@invite.event_id), notice: 'Invitation sent'
    else
      redirect_to event_path(@invite.event_id), alert: 'Error creating invitation!'
    end
  end
end
