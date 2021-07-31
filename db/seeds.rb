# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Favorite.destroy_all
Friendship.destroy_all

require 'faker'

#generate random users
for i in 0..10
  User.create(
    email: Faker::Internet.unique.safe_email,
    nickname: Faker::Name.first_name,
    password: "password"
  )
end

# random posts
users = User.all
for i in 0..100
  user = users[rand(0..users.size-1)]
  # print user.nickname + "\n"
  post = user.posts.new(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
    content: Faker::Lorem.sentence(word_count: 15, supplemental: false, random_words_to_add: 15),
    user_id: user.id
  )
  post.save
end

#random favorites
posts = Post.all
for i in 0..1000
  post = posts[rand(0..posts.size-1)]
  user = users[rand(0..users.size-1)]
  if not Favorite.find_by(user_id: user, post_id: post)
    Favorite.create(
      user_id: user.id,
      post_id: post.id
    )
  end
end

for i in 0..50
  userA = users[rand(0..users.size-1)].id
  for j in 0..50
    userB = users[rand(0..users.size-1)].id
    while userA == userB
      userB = users[rand(0..users.size-1)].id
    end
    friendship = Friendship.create(
      user_id: userA,
      friend_id: userB
    )
    puts i, friendship.user_id, j, friendship.friend_id
  end
end
