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

Peter = User.create! email: "peter@gmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Peter", last_name: "Smith"
Tracy = User.create! email: "tracy@gmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Tracy", last_name: "Doe"
Sally = User.create! email: "sally@gmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Sally", last_name: "Thompson"
Harry = User.create! email: "harry@gmail.com", password: "12345678", password_confirmation: "12345678", first_name: "Harry", last_name: "Roberts"

PeterP = Profile.create! first_name: "Peter", public: false, user: Peter, earnings: 20, last_name: "Peter", bio: "I run a live/work space for artists here in Cape Town, as well as another arts complex with a gallery, art studios, and dance studio. I like to have fun with life and keep positive people around me all the time."
TracyP = Profile.create! first_name: "Tracy", public: false, user: Tracy, earnings: 15, last_name: "Tracy", bio: "I'm a modern dance choreographer/performer/educator. I've lived in Cape Town since 1996 and have seen all of its changes. I love the rich cultural diversity of Cape Town and its creative spirit."
SallyP = Profile.create! first_name: "Sally", public: false, user: Sally, earnings: 200, last_name: "Sally", bio: "Work at Enra in Cape Town. Graduated UCT in 2011 with a major in economics. Food Lover."
HarryP = Profile.create! first_name: "Harry", public: false, user: Harry, earnings: 0, last_name: "Harry", bio: "I've been in Cape Town for over 10 years and have loved every minute of it! When I'm not home, I'm off traveling to some amazing places all over the world. I enjoy running, yoga, scuba diving and enjoying an amazing glass of wine here, there and everywhere! :)"


PSpace1 = Space.create! name: "iX House", category: "Room", description: "Our conference room is great for meetings!", location: "19 Park Street, Gardens, Cape Town, South Africa", price: 200, capacity: 30, user: Peter
PSpace2 = Space.create! name: "Once", category: "Outdoor Area", description: "Choose us for your backyard braai! Full-size fireplace + small grill + full-size kitchen.", location: "73 Kloof Street, Gardens, Cape Town, South Africa", price: 300, capacity: 40, user: Peter
PSpace3 = Space.create! name: "International School of Cape Town", category: "Room", description: "After hours, our classrooms can be used for everything from workshops to art studio space", location: "Woodland Heights, Edinburgh Close, Wynberg 7806, Cape Town, South Africa", price: 100, capacity: 30, user: Peter
PSpace4 = Space.create! name: "Yours Truly", category: "Display", description: "Our walls would be perfect for displaying local artists' work.", location: "73 Kloof Street, Gardens, Cape Town, South Africa", price: 20, capacity: 1, user: Peter

TSpace1 = Space.create! name: "Mzanzi's", category: "Room", description: "We're a family-owned restaurant in the heart of Langa, and we're passionate about supporting local musicians", location: "45 Harlem Ave, Langa, Cape Town, 7455", price: 20, capacity: 20, user: Tracy
TSpace2 = Space.create! name: "Community Center", category: "Building", description: "Flexible space that includes and ampitheater, ceramics facilities, and a gathering space.", location: "Langa, Cape Town", price: 150, capacity: 60, user: Tracy
# TSpace3 = Space.create! name: "Community Center", category: "Display", description: "We would love to provide local artists the opportunity to display their work and increase their visibility", location: "Langa, Cape Town", price: 20, capacity: 40, user: Tracy

SEvent1 = Event.create! name: "Weekly Yoga Class", location: "Cape Town", people: 15, category: "Workshop/Class", description: "Join me for yoga at the end of a long week to help destress", public: true, user: Sally, date: DateTime.parse("2/8/2015 17:00"), space: PSpace3
SEvent2 = Event.create! name: "Ray's 21st Birthday!", location: "Cape Town", people: 25, category: "Gathering", description: "I'm throwing my friend Ray a surprise birthday party", public: false, user: Sally, date: DateTime.parse("10/8/2015 17:00"), space: PSpace3
SEvent3 = Event.create! name: "Art Studio Hours", location: "Cape Town", people: 1, category: "Personal", description: "Looking for a space to finish some art pieces", public: false, user: Sally, date: DateTime.parse("17/8/2015 17:00"), space: PSpace3
SEvent4 = Event.create! name: "Volunteers4Change", location: "Cape Town", people: 50, category: "Gathering", description: "I want to bring together local volunteers to knit scarves for shelters", public: true, user: Sally, date: DateTime.parse("11/8/2015 17:00")


HEvent1 = Event.create! name: "Going Away Party", location: "Joburg", people: 50, category: "Gathering", description: "Celebration for my best friend's going away", public: false, user: Harry, date: DateTime.parse("15/8/2015 17:00"), space: PSpace3
HEvent2 = Event.create! name: "Entrepreneur Workshop", location: "Cape Town", people: 20, category: "Workshop/Class", description: "A workshop to help budding entrepreneurs.", public: true, user: Harry, date: DateTime.parse("12/8/2015 17:00"), space: PSpace3
HEvent3 = Event.create! name: "Slam Poetry Performance", location: "Cape Town", people: 100, category: "Performance", description: "Come see UCT students perform original slap poetry", public: true, user: Harry, date: DateTime.parse("20/8/2015 17:00"), space: PSpace3

Review.create! user: Tracy, space: PSpace3, rating: 4, body: "Enjoyed the fun lighting and space, but it was a little too cold"
Review.create! user: Harry, space: PSpace3, rating: 5, body: "The classrooms were the perfect size for my workshop!"

Message.create! sender: Tracy, recipient: Peter, body: "Hi! Can you tell me more about your space?", subject: "International School of Cape Town"
Message.create! sender: Harry, recipient: Peter, body: "Is the price negotiable?", subject: "Negotiable Price"

Request.create!  space: PSpace1, event: HEvent1, body: "I want to throw a party"



# ian = User.create! email: "ian@ian.com", password: "12345678", password_confirmation: "12345678"
# brian = User.create! email: "brian@brian.com", password: "12345678", password_confirmation: "12345678"
# erica = User.create! email: "erica@erica.com", password: "12345678", password_confirmation: "12345678"
# cam = User.create! email: "cam@cam.com", password: "12345678", password_confirmation: "12345678"
# aobo = User.create! email: "aobo@aobo.com", password: "12345678", password_confirmation: "12345678"
# tim = User.create! email: "tim@tim.com", password: "12345678", password_confirmation: "12345678"

# ianP = Profile.create! first_name: "ian", public: false, user: ian, earnings: 20, last_name: "ian", bio: "I'm ian"
# brianP = Profile.create! first_name: "brian", public: false, user: brian, earnings: 0, last_name: "brian", bio: "I'm brian"
# ericaP = Profile.create! first_name: "erica", public: false, user: erica, earnings: 100, last_name: "ian", bio: "I'm erica"
# aoboP = Profile.create! first_name: "aobo", public: false, user: aobo, earnings: 350, last_name: "aobo", bio: "I'm aobo"
# timP = Profile.create! first_name: "tim", public: false, user: cam, earnings: 10, last_name: "cam", bio: "I'm cam"
# camP = Profile.create! first_name: "cam", public: false, user: tim, earnings: 15, last_name: "tim", bio: "I'm tim"

# ian_space = Space.create! name: "Once", category: "Room", description: "hipster hostel", location: "73 Kloof Street, Gardens, Cape Town, South Africa", price: 200, capacity: 40, user: ian
# brian_space = Space.create! name: "iX House", category: "Building", description: "movie room with fat sacsl", location: "19 Park Rd, Cape Town, South Africa", price: 100, capacity: 20, user: brian
# erica_space = Space.create! name: "Knead", category: "Room", description: "delicious food", location: "50 Kloof Street, Cape Town, South Africa", price: 250, capacity: 50, user: erica

# cam_event = Event.create! name: "birthday party", location: "cape town", people: 20, category: "Gathering", description: "best friend's 21st", public: false, user: cam, date: DateTime.parse("2/8/2015 17:00")
# aobo_event = Event.create! name: "weekly pottery workshop", location: "cape town", people: 10, category: "Workshop/Class", description: "beginner's intro to pottery", public: true, user: aobo, date: DateTime.parse("3/8/2015 18:00")
# tim_event = Event.create! name: "choreography", location: "cape town", people: 1, category: "Personal", description: "making dance for recital", public: false, user: tim, date: DateTime.parse("3/8/2015 20:00"), space: erica_space
# brian_event = Event.create! name: "local burning man", location: "joburg", people: 40, category: "Gathering", description: "bringing burning man to SA", public: false, user: brian, date: DateTime.parse("2/8/2015 11:00")
# brian_event2 = Event.create! name: "kombucha!!", location: "joburg", people: 40, category: "Gathering", description: "brew your own", public: false, user: brian, date: DateTime.parse("4/8/2015 11:00")

# Review.create! user: cam, space: ian_space, rating: 4, body: "meh"
# Review.create! user: aobo, space: erica_space, rating: 5, body: "ERICA I LOVE YOU", reply: "thanks"
# Review.create! user: erica, space: brian_space, rating: 1, body: "aight", reply: "thanks"
# Review.create! user: tim, space: brian_space, rating: 4, body: "meh"

# Message.create! sender: ian, recipient: cam, body: "have a party", subject: "rent my space"
# Message.create! sender: brian, recipient: tim, body: "you can dance at iX", subject: "dance room 4 u"
# Message.create! sender: erica, recipient: aobo, body: "stalker", subject: "stop"

# Request.create!  space: ian_space, event: cam_event, body: "help"
# Request.create!  space: brian_space, event: aobo_event, body: "me"
# Request.create!  space: erica_space, event: tim_event, body: "please"
# Request.create!  space: ian_space, event: brian_event, body: "burn"
