class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :attending_events, through: :attendances, source: :event

  validates :username, presence: true, uniqueness: true

  def attending?(event)
    attendances.exists?(event_id: event.id)
  end
end
