class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :going_attendances, -> { where(status: "going") }, class_name: "Attendance"
  has_many :attending_events, through: :going_attendances, source: :event

  validates :username, presence: true, uniqueness: true

  def invited?(event)
    attendances.exists?(event_id: event.id, status: "invited")
  end

  def attending?(event)
    attendances.exists?(event_id: event.id, status: "going")
  end

  def declined?(event)
    attendances.exists?(event_id: event.id, status: "not going")
  end

  # checks to see if an attendance instance has been created
  def attendance_created?(event)
    attendances.exists?(event_id: event.id)
  end
end
