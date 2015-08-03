# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.delete_all
Space.delete_all
User.delete_all

ian = User.create! email: "ian@ian.com", password: "12345678", password_confirmation: "12345678"
brian = User.create! email: "brian@brian.com", password: "12345678", password_confirmation: "12345678"
erica = User.create! email: "erica@erica.com", password: "12345678", password_confirmation: "12345678"
cam = User.create! email: "cam@cam.com", password: "12345678", password_confirmation: "12345678"
aobo = User.create! email: "aobo@aobo.com", password: "12345678", password_confirmation: "12345678"
tim = User.create! email: "tim@tim.com", password: "12345678", password_confirmation: "12345678"

Space.create! name: "Once", category: "Room", description: "hipster hostel", location: "Cape Town", price: 200, capacity: 40, user: ian
Space.create! name: "iX House", category: "Building", description: "movie room with fat sacsl", location: "Cape Town", price: 100, capacity: 20, user: brian
Space.create! name: "Knead", category: "Room", description: "delicious food", location: "Cape Town", price: 250, capacity: 50, user: erica

Event.create! name: "birthday party", location: "cape town", people: 20, category: "Gathering", description: "best friend's 21st", public: false, user: cam
Event.create! name: "weekly pottery workshop", location: "cape town", people: 10, category: "Workshop/Class", description: "beginner's intro to pottery", public: true, user: aobo
Event.create! name: "choreography", location: "cape town", people: 1, category: "Personal", description: "making dance for recital", public: false, user: tim
