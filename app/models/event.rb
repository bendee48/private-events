class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user # maybe don't need anymore?

  validates :date, :location, :title, presence: true

  scope :upcoming, -> { where("date >= ?", Time.now) }
  scope :past,     -> { where("date < ?", Time.now) }

  # wrong
  def guests
    User.joins(:attendances).where(attendances: { status: "going", event_id: id })
  end
end
