class Admin::InvitationsController < ApplicationController
  layout 'admin'

  before_action :set_invitation, only: %i[show destroy]

  def index
    authorize(:invitation)

    @invitations = Invitation.order(:expires_at)
  end

  def new
    authorize(:invitation)

    @invitation = Invitation.new
  end

  def create
    authorize(:invitation)

    @invitation = Invitation.new(invitation_params)

    if @invitation.valid?
      @invitation.user = current_user
      @invitation.save!
    else
      render :new
    end
  end

  def destroy
    authorize(@invitation)

    @invitation.destroy!

    redirect_to admin_invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:name, :role)
  end

  def set_invitation
    @invitation = Invitation.find_by!(uuid: params[:uuid])
  end
end
