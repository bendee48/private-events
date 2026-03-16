class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendances
  has_many :going_attendances, -> { where(attendances: { status: "going" }) }, class_name: "Attendance"
  has_many :attendees, through: :going_attendances, source: :user
  enum :visibility, { private_event: 0, public_event: 1 }

  validates :date, :location, :title, presence: true

  scope :upcoming, -> { where("date >= ?", Time.now).order(:date) }
  scope :past,     -> { where("date < ?", Time.now).order(:date) }


  def created_by?(user)
    user_id == user.id
  end

  # Returns the Attendance record associated with this event and a provided user
  def attendance_for(user)
    attendances.find_by(user_id: user.id)
  end

  def formatted_date
    date.strftime("%d %B, %Y")
  end
end
