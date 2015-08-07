# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Request.delete_all
Message.delete_all
Review.delete_all
Event.delete_all
Space.delete_all
Profile.delete_all
User.delete_all

John = User.create! email: "john@gmail.com", password: "12345678", password_confirmation: "12345678"
Mary = User.create! email: "mary@gmail.com", password: "12345678", password_confirmation: "12345678"
Sally = User.create! email: "sally@gmail.com", password: "12345678", password_confirmation: "12345678"
Joe = User.create! email: "joe@gmail.com", password: "12345678", password_confirmation: "12345678"

JohnP = Profile.create! username: "John", public: false, user: John, earnings: 20, name: "John", bio: "I run a live/work space for artists here in Cape Town, as well as another arts complex with a gallery, art studios, and dance studio. I like to have fun with life and keep positive people around me all the time."
MaryP = Profile.create! username: "Mary", public: false, user: Mary, earnings: 15, name: "Mary", bio: "I'm a modern dance choreographer/performer/educator. I've lived in Cape Town since 1996 and have seen all of its changes. I love the rich cultural diversity of Cape Town and its creative spirit."
SallyP = Profile.create! username: "Sally", public: false, user: Sally, earnings: 200, name: "Sally", bio: "Work at Enra in Cape Town. Graduated UCT in 2011 with a major in economics. Food Lover."
Joe = Profile.create! username: "Joe", public: false, user: Joe, earnings: 0, name: "Joe", bio: "I've been in Cape Town for over 10 years and have loved every minute of it! When I'm not home, I'm off traveling to some amazing places all over the world. I enjoy running, yoga, scuba diving and enjoying an amazing glass of wine here, there and everywhere! :)"


ian = User.create! email: "ian@ian.com", password: "12345678", password_confirmation: "12345678"
brian = User.create! email: "brian@brian.com", password: "12345678", password_confirmation: "12345678"
erica = User.create! email: "erica@erica.com", password: "12345678", password_confirmation: "12345678"
cam = User.create! email: "cam@cam.com", password: "12345678", password_confirmation: "12345678"
aobo = User.create! email: "aobo@aobo.com", password: "12345678", password_confirmation: "12345678"
tim = User.create! email: "tim@tim.com", password: "12345678", password_confirmation: "12345678"

ianP = Profile.create! username: "ian", public: false, user: ian, earnings: 20, name: "ian", bio: "I'm ian"
brianP = Profile.create! username: "brian", public: false, user: brian, earnings: 0, name: "brian", bio: "I'm brian"
ericaP = Profile.create! username: "erica", public: false, user: erica, earnings: 100, name: "ian", bio: "I'm erica"
aoboP = Profile.create! username: "aobo", public: false, user: aobo, earnings: 350, name: "aobo", bio: "I'm aobo"
timP = Profile.create! username: "tim", public: false, user: cam, earnings: 10, name: "cam", bio: "I'm cam"
camP = Profile.create! username: "cam", public: false, user: tim, earnings: 15, name: "tim", bio: "I'm tim"

ian_space = Space.create! name: "Once", category: "Room", description: "hipster hostel", location: "73 Kloof Street, Gardens, Cape Town, South Africa", price: 200, capacity: 40, user: ian
brian_space = Space.create! name: "iX House", category: "Building", description: "movie room with fat sacsl", location: "19 Park Rd, Cape Town, South Africa", price: 100, capacity: 20, user: brian
erica_space = Space.create! name: "Knead", category: "Room", description: "delicious food", location: "50 Kloof Street, Cape Town, South Africa", price: 250, capacity: 50, user: erica

cam_event = Event.create! name: "birthday party", location: "cape town", people: 20, category: "Gathering", description: "best friend's 21st", public: false, user: cam, date: DateTime.parse("2/8/2015 17:00")
aobo_event = Event.create! name: "weekly pottery workshop", location: "cape town", people: 10, category: "Workshop/Class", description: "beginner's intro to pottery", public: true, user: aobo, date: DateTime.parse("3/8/2015 18:00")
tim_event = Event.create! name: "choreography", location: "cape town", people: 1, category: "Personal", description: "making dance for recital", public: false, user: tim, date: DateTime.parse("3/8/2015 20:00"), space: erica_space
brian_event = Event.create! name: "local burning man", location: "joburg", people: 40, category: "Gathering", description: "bringing burning man to SA", public: false, user: brian, date: DateTime.parse("2/8/2015 11:00")
brian_event2 = Event.create! name: "kombucha!!", location: "joburg", people: 40, category: "Gathering", description: "brew your own", public: false, user: brian, date: DateTime.parse("4/8/2015 11:00")

Review.create! user: cam, space: ian_space, rating: 4, body: "meh"
Review.create! user: aobo, space: erica_space, rating: 5, body: "ERICA I LOVE YOU", reply: "thanks"
Review.create! user: erica, space: brian_space, rating: 1, body: "aight", reply: "thanks"
Review.create! user: tim, space: brian_space, rating: 4, body: "meh"

Message.create! sender: ian, recipient: cam, body: "have a party", subject: "rent my space"
Message.create! sender: brian, recipient: tim, body: "you can dance at iX", subject: "dance room 4 u"
Message.create! sender: erica, recipient: aobo, body: "stalker", subject: "stop"

Request.create!  space: ian_space, event: cam_event, body: "help"
Request.create!  space: brian_space, event: aobo_event, body: "me"
Request.create!  space: erica_space, event: tim_event, body: "please"
Request.create!  space: ian_space, event: brian_event, body: "burn"
