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

# Events
Event.create!(title: "My Birthday", location: 'My House', date: Time.new(2026, 2, 22), user_id: 1)
Event.create!(title: "Cinema", location: 'Doon Toon', date: Time.new(2026, 2, 28), user_id: 1)
Event.create!(title: "Gig", location: 'Hackney', date: Time.new(2026, 4, 4), user_id: 2)
Event.create!(title: "Climbing", location: 'Dorset', date: Time.new(2026, 8, 7), user_id: 2)
Event.create!(title: "Rave", location: 'Manchester', date: Time.new(2026, 5, 1), user_id: 3)

# Attendances
Attendance.create!(user_id: 1, event_id: 1)
Attendance.create!(user_id: 1, event_id: 2)
Attendance.create!(user_id: 1, event_id: 3)
Attendance.create!(user_id: 2, event_id: 1)
Attendance.create!(user_id: 2, event_id: 5)
Attendance.create!(user_id: 3, event_id: 1)

puts "Created 3 users, 5 events and 6 attendances"
