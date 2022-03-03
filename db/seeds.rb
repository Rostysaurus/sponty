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
    password: '123456'
    )
  user1.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/1.png")), filename: "1")
  user1.save!

  user2 = User.new(
    email: 'rosty@email.com',
    password: '123456'
    )
  user2.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/2.png")), filename: "2")
  user2.save!

  user3 = User.new(
    email: 'kinga@email.com',
    password: '123456'
    )
  user3.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/3.png")), filename: "3")
  user3.save!

  user4 = User.new(
    email: 'viktor@email.com',
    password: '123456'
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
count2 = 0
10.times do
  if count2 <= 10
    count2 += 1
    experience = Experience.new(
      name:    Faker::Restaurant.name,
      address: "Rudi-Dutschke-Straße 2#{count2}, 10969 Berlin",
      event_type: Faker::Restaurant.type,
      busyness: "busy"
    )
    experience.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/experiences/#{count2}.jpeg")), filename: "#{count2}")
    experience.user = user1
    experience.save!
    count2 += 1
  elsif count2 > 10
    count2 = 0
  end
end
puts 'Finished creating experiences!'
