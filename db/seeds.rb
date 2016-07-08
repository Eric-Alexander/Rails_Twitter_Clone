# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(first_name:  "John",
            last_name:  "Doe",
             email: "booboo@foobar.com",
             password:              "foobar",
             password_confirmation: "foobar")

40.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "fake#{n+1}@foobar.com"
  password = "password"
  User.create!(first_name:  first_name,
                last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
38.times do
    title= Faker::Book.title
  content = Faker::Lorem.sentence(4)
  users.each { |user| user.posts.create!(content: content, title: title) }
end

users= User.all
user = users.first
user2= users.second
following = users[ 3 .. 36]
followers = users[ 4 .. 38 ]
following.each{|followed| user.follow(followed)}
followers.each{|follower| follower.follow(user)}
following.each{|followed| user2.follow(followed)}
followers.each{|follower| follower.follow(user2)}
