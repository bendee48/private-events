class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendances
  has_many :going_attendances, -> { where(attendances: { status: "going" }) }, class_name: "Attendance"
  has_many :attendees, through: :going_attendances, source: :user

  validates :date, :location, :title, presence: true

  scope :upcoming, -> { where("date >= ?", Time.now) }
  scope :past,     -> { where("date < ?", Time.now) }

  # def guests
  #   User.joins(:attendances).where(attendances: { status: "going", event_id: id })
  # end

  def created_by?(user)
    user_id == user.id
  end
end
