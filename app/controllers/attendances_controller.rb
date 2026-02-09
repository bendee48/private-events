class AttendancesController < ApplicationController
  def create
    user = current_user
    event = Event.find(params[:event_id])
    attendance = user.attendances.build(event: event)

    if attendance.save
      redirect_back fallback_location: event_path(event), notice: "You're attending!"
    else
      redirect_back fallback_location: event_path(event), alert: attendance.full_messages.to_sentence
    end
  end
end
