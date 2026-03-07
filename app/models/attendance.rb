class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :user_already_attending?

  def user_already_attending?
    if Attendance.exists?(user_id: user_id, event_id: event_id, status: "going")
      errors.add(:base, "You're already attending this event!")
    end
  end
end
