# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database of experiences ..."

Experience.destroy_all
User.destroy_all


puts 'Creating 4 fake users...'
  user1 = User.new(
    email: 'ipek@email.com',
    password: '123456',
    nickname: "Ipek",
    location: "Berlin"
    )
  user1.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/1.png")), filename: "1")
  user1.save!

  user2 = User.new(
    email: 'rosty@email.com',
    password: '123456',
    nickname: "Rosty",
    location: "Berlin"
    )
  user2.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/2.png")), filename: "2")
  user2.save!

  user3 = User.new(
    email: 'kinga@email.com',
    password: '123456',
    nickname: "Kinga",
    location: "Berlin"
    )
  user3.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/3.png")), filename: "3")
  user3.save!

  user4 = User.new(
    email: 'viktor@email.com',
    password: '123456',
    nickname: "Viktor",
    location: "Berlin"
    )
  user4.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/4.png")), filename: "4")
  user4.save!

puts "Finished creating users!"

# file = URI.open('app/assets/images/users/1.jpg')
# user1.photo.attach(io: file, filename: '1.jpg', content_type: 'image/jpg')

user1.save!
user2.save!
user3.save!
user4.save!

puts 'Creating 10 experiences...'
murphys = Experience.new(
  name: "Murphy's Irish Pub",
  address: "Zimmerstraße 19, 10969 Berlin",
  event_type: "bar",
  busyness: "busy"
)
murphys.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/murphys.jpg")), filename: "murphys.jpg")

murphys.user = user1
chatroom = Chatroom.create(name: "#{murphys.name}-chatroom")
murphys.chatroom = chatroom
murphys.save!

brewdog = Experience.new(
  name: "BrewDog",
  address: "Ackerstraße 29, 10115 Berlin",
  event_type: "bar",
  busyness: "semi-busy"
)
brewdog.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/brewdog.jpg")), filename: "brewdog.jpg")

brewdog.user = user1
chatroom = Chatroom.create(name: "#{brewdog.name}-chatroom")
brewdog.chatroom = chatroom
brewdog.save!

aromas = Experience.new(
  name: "Aromas Café",
  address: "Marienburger Str. 26 A, 10405 Berlin",
  event_type: "cafe",
)
aromas.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/aromas.jpeg")), filename: "aromas.jpeg")

aromas.user = user1
chatroom = Chatroom.create(name: "#{aromas.name}-chatroom")
aromas.chatroom = chatroom
aromas.save!

kuriya = Experience.new(
  name: "Ki Kuriya",
  address: "Hufelandstraße 14, 10407 Berlin",
  event_type: "restaurant"
)
kuriya.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/kuriya.jpg")), filename: "kuriya.jpg")

kuriya.user = user1
chatroom = Chatroom.create(name: "#{kuriya.name}-chatroom")
kuriya.chatroom = chatroom
kuriya.save!

frannz = Experience.new(
  name: "FRANNZ Club",
  address: "ZSchönhauser Allee 36, 10435 Berlin",
  event_type: "club"
)
frannz.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/frannz.jpg")), filename: "frannz.jpg")

frannz.user = user1
chatroom = Chatroom.create(name: "#{frannz.name}-chatroom")
frannz.chatroom = chatroom
frannz.save!

kitkat = Experience.new(
  name: "KitKatClub",
  address: "Köpenicker Straße 76, Brückenstraße 1, 10179 Berlin",
  event_type: "club"
)
kitkat.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/kitkat.jpg")), filename: "kitkat.jpg")

kitkat.user = user1
chatroom = Chatroom.create(name: "#{kitkat.name}-chatroom")
kitkat.chatroom = chatroom
kitkat.save!

imbiss = Experience.new(
  name: "W - Der Imbiss",
  address: "Kastanienallee 49, 10119 Berlin",
  event_type: "restaurant"
  )
imbiss.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/imbiss.jpg")), filename: "imbiss.jpg")
imbiss.user = user1
chatroom = Chatroom.create(name: "#{imbiss.name}-chatroom")
imbiss.chatroom = chatroom
imbiss.save!

dunckerclub = Experience.new(
  name: "Dunckerclub",
  address: " Dunckerstraße 64, 10439 Berlin",
  event_type: "bar"
)
dunckerclub.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/duncker.jpg")), filename: "duncker.jpg")
dunckerclub.user = user1
chatroom = Chatroom.create(name: "#{dunckerclub.name}-chatroom")
dunckerclub.chatroom = chatroom
dunckerclub.save!

kaminbar= Experience.new(
  name: "Kaminbar",
  address: "Oderberger Str. 57, 10435 Berlin",
  event_type: "bar"
)
kaminbar.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/kaminbar.jpg")), filename: "kaminbar.jpg")
kaminbar.user = user1
chatroom = Chatroom.create(name: "#{kaminbar.name}-chatroom")
kaminbar.chatroom = chatroom
kaminbar.save!

bonanza = Experience.new(
  name: "Bonanza Coffee Heroes",
  address: "Oderberger Str. 35, 10435 Berlin",
  event_type: "cafe",
  )
bonanza.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/bonanza.jpg")), filename: "bonanza.jpg")
bonanza.user = user1
chatroom = Chatroom.create(name: "#{bonanza.name}-chatroom")
bonanza.chatroom = chatroom
bonanza.save!


puts 'Finished creating experiences!'
