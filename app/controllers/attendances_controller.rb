class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]
  def create
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    attendance = user.attendances.build(event_id: event.id, status: "invited")

    if attendance.save
      redirect_back fallback_location: event_path(event), notice: "#{user.username} has been invited."
    else
      redirect_back fallback_location: event_path(event), alert: attendance.errors.full_messages.to_sentence
    end
  end
end
