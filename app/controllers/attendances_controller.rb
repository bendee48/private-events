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

  def update
    attendance = Attendance.find(params[:id])
    status = params[:attendance][:status]

    if attendance.update(status: status)
      redirect_back fallback_location: user_path(current_user), notice: "You are #{status}!"
    else
      redirect_back fallback_location: user_path(current_user), alert: attendance.errors.full_messages.to_sentence
    end
  end
end
