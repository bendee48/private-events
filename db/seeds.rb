# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Event.destroy_all
Attendance.destroy_all

# Users
User.create!(username: "Ben", email: "ben@email.com", password: 'password')
User.create!(username: "Anna", email: "anna@email.com", password: 'password')
User.create!(username: "Rob", email: "rob@email.com", password: 'password')
User.create!(username: "Jess", email: "jess@email.com", password: 'password')

# Events
Event.create!(title: "My Birthday", location: 'My House', date: Time.new(2026, 2, 22), user_id: 1)
Attendance.create(user_id: 1, event_id: 1, status: "going")
Event.create!(title: "Cinema", location: 'Doon Toon', date: Time.new(2026, 2, 28), user_id: 1)
Attendance.create(user_id: 1, event_id: 2, status: "going")
Event.create!(title: "Gig", location: 'Hackney', date: Time.new(2026, 4, 4), user_id: 2)
Attendance.create(user_id: 2, event_id: 3, status: "going")
Event.create!(title: "Climbing", location: 'Dorset', date: Time.new(2026, 8, 7), user_id: 2)
Attendance.create(user_id: 2, event_id: 4, status: "going")
Event.create!(title: "Rave", location: 'Manchester', date: Time.new(2026, 5, 1), visibility: 1, user_id: 3)
Attendance.create(user_id: 3, event_id: 5, status: "going")
Event.create!(title: "Apple Picking", location: 'Dorset', date: Time.new(2026, 7, 21), visibility: 1, user_id: 3)
Attendance.create(user_id: 3, event_id: 6, status: "going")
Event.create!(title: "River Cruise", location: 'Paris', date: Time.new(2027, 4, 7), user_id: 3)
Attendance.create(user_id: 3, event_id: 7, status: "going")
Event.create!(title: "Walking Tour", location: 'Argentina', date: Time.new(2028, 12, 6), user_id: 3)
Attendance.create(user_id: 3, event_id: 8, status: "going")

# Attendances
Attendance.create!(user_id: 1, event_id: 3, status: "going")
Attendance.create!(user_id: 2, event_id: 1, status: "invited")
Attendance.create!(user_id: 2, event_id: 5, status: "going")
Attendance.create!(user_id: 3, event_id: 1, status: "invited")
Attendance.create!(user_id: 1, event_id: 6, status: "invited")
Attendance.create!(user_id: 2, event_id: 6, status: "invited")
Attendance.create!(user_id: 3, event_id: 4, status: "not going")
Attendance.create!(user_id: 4, event_id: 6, status: "invited")
Attendance.create!(user_id: 4, event_id: 7, status: "invited")
Attendance.create!(user_id: 4, event_id: 8, status: "invited")

puts "Created 4 users, 8 events and 10 attendances"
