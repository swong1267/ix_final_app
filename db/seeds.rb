# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Space.delete_all

Space.create! name: "Once", category: "gathering", description: "hipster hostel", location: "Cape Town", price: 200, capacity: 40
Space.create! name: "iX House", category: "media room", description: "movie room with fat sacsl", location: "Cape Town", price: 100, capacity: 20
Space.create! name: "Knead", category: "gathering", description: "delicious food", location: "Cape Town", price: 250, capacity: 50
