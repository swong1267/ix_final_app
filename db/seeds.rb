# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Request.delete_all
Space.delete_all
User.delete_all

ian = User.create! email: "ian@ian.com", password: "12345678", password_confirmation: "12345678"
brian = User.create! email: "brian@brian.com", password: "12345678", password_confirmation: "12345678"
erica = User.create! email: "erica@erica.com", password: "12345678", password_confirmation: "12345678"
cam = User.create! email: "cam@cam.com", password: "12345678", password_confirmation: "12345678"
aobo = User.create! email: "aobo@aobo.com", password: "12345678", password_confirmation: "12345678"
tim = User.create! email: "tim@tim.com", password: "12345678", password_confirmation: "12345678"

Space.create! name: "Once", category: "gathering", description: "hipster hostel", location: "Cape Town", price: 200, capacity: 40, user: ian
Space.create! name: "iX House", category: "media room", description: "movie room with fat sacsl", location: "Cape Town", price: 100, capacity: 20, user: brian
Space.create! name: "Knead", category: "gathering", description: "delicious food", location: "Cape Town", price: 250, capacity: 50, user: erica

Request.create! name: "birthday party", people: 20, category: "party", description: "best friend's 21st", public: false, user: cam
Request.create! name: "weekly pottery workshop", people: 10, category: "workshop", description: "beginner's intro to pottery", public: true, user: aobo
Request.create! name: "choreography", people: 1, category: "single person", description: "making dance for recital", public: false, user: tim
