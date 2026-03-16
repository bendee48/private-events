class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]
  before_action :authorize_user!, only: [ :show ]
  def show
    # Using #invited_attendances for invites rather than just #invites as the attendance record will be
    # being updated from here
    @invited_attendances = @user.invited_attendances.includes(:event).order(event: { date: :asc })
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Not authorized for that action" unless current_user == @user
  end
end
