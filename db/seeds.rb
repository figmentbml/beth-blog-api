# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Comment.delete_all
Post.delete_all

user1 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )
user2 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )
user3 = User.create!( first_name: Faker::Name.name, last_name: Faker::Name.name )

post1 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user1
)

post2 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user1
)

post3 = Post.create!(
title: Faker::Lorem.sentence,
body: Faker::Lorem.paragraphs.join("\n\n"),
user: user2
)

Comment.create!(
user: user3,
post: post1,
body: Faker::Lorem.paragraph
)

Comment.create!(
user: user2,
post: post1,
body: Faker::Lorem.paragraph
)

Comment.create!(
user: user1,
post: post3,
body: Faker::Lorem.paragraph
)
