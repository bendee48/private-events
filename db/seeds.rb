# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


if Rails.env.development?
  puts "Clearing database..."
  User.destroy_all
  Event.destroy_all
  Attendance.destroy_all
end

puts "Seeding database..."

# Users
ben = User.find_or_create_by!(email: "ben@email.com") do |user|
  user.username = "Ben"
  user.password = 'password'
end
anna = User.find_or_create_by!(email: "anna@email.com") do |user|
  user.username = "Anna"
  user.password = 'password'
end
rob = User.find_or_create_by!(email: "rob@email.com") do |user|
  user.username = "Rob"
  user.password = 'password'
end
jess = User.find_or_create_by!(email: "jess@email.com") do |user|
  user.username = "Jess"
  user.password = 'password'
end

# Events (Attendance is also created to add the creator to the list of attendees for the event)
event1 = Event.find_or_create_by!(title: "My Birthday") do |event|
  event.location = 'My House'
  event.date = Time.new(2026, 2, 22)
  event.creator = ben
end
Attendance.find_or_create_by!(user: ben, event: event1) do |att|
  att.status = "going"
end
event2 = Event.find_or_create_by!(title: "Cinema") do |event|
  event.location = 'Doon Toon'
  event.date = Time.new(2026, 2, 28)
  event.creator = ben
end
Attendance.find_or_create_by!(user: ben, event: event2) do |att|
  att.status = "going"
end
event3 = Event.find_or_create_by!(title: "Gig") do |event|
  event.location = 'Hackney'
  event.date = Time.new(2026, 4, 4)
  event.creator = anna
end
Attendance.find_or_create_by!(user: anna, event: event3) do |att|
  att.status = "going"
end
event4 = Event.find_or_create_by!(title: "Climbing") do |event|
  event.location = 'Dorset'
  event.date = Time.new(2026, 8, 7)
  event.creator = anna
end
Attendance.find_or_create_by!(user: anna, event: event4) do |att|
  att.status = "going"
end
event5 = Event.find_or_create_by!(title: "Rave") do |event|
  event.location = 'Manchester'
  event.date = Time.new(2026, 5, 1)
  event.visibility = 1
  event.creator = rob
end
Attendance.find_or_create_by!(user: rob, event: event5) do |att|
  att.status = "going"
end
event6 = Event.find_or_create_by!(title: "Apple Picking") do |event|
  event.location = 'Somerset'
  event.date = Time.new(2026, 7, 21)
  event.visibility = 1
  event.creator = rob
end
Attendance.find_or_create_by!(user: rob, event: event6) do |att|
  att.status = "going"
end
event7 = Event.find_or_create_by!(title: "River Cruise") do |event|
  event.location = 'Paris'
  event.date = Time.new(2027, 4, 7)
  event.creator = rob
end
Attendance.find_or_create_by!(user: rob, event: event7) do |att|
  att.status = "going"
end
event8 = Event.find_or_create_by!(title: "Walking Tour") do |event|
  event.location = 'Argentina'
  event.date = Time.new(2028, 12, 6)
  event.creator = rob
end
Attendance.find_or_create_by!(user: rob, event: event8) do |att|
  att.status = "going"
end


# Attendances
Attendance.find_or_create_by!(user: ben, event: event3, status: "going")
Attendance.find_or_create_by!(user: anna, event: event1, status: "invited")
Attendance.find_or_create_by!(user: anna, event: event5, status: "going")
Attendance.find_or_create_by!(user: rob, event: event1, status: "invited")
Attendance.find_or_create_by!(user: ben, event: event6, status: "invited")
Attendance.find_or_create_by!(user: anna, event: event6, status: "invited")
Attendance.find_or_create_by!(user: rob, event: event4, status: "not going")
Attendance.find_or_create_by!(user: jess, event: event6, status: "invited")
Attendance.find_or_create_by!(user: jess, event: event7, status: "invited")
Attendance.find_or_create_by!(user: jess, event: event8, status: "invited")

puts "Created 4 users, 8 events and 10 attendances"
