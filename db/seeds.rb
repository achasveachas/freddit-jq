# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.free_email, password: "testtest", password_confirmation: "testtest", image_url: Faker::LoremPixel.image)
end

30.times do
  c = Conversation.new(topic: Faker::Hipster.sentence, post: Faker::Hipster.paragraph)
  c.user = User.order("RANDOM()").first
  c.save
end

Conversation.all.each do |convo|
  count = rand(1..5)
  count.times do
     c = convo.comments.create(body: Faker::Hipster.paragraph)
     c.user = User.order("RANDOM()").first
     c.save
  end
end

Comment.all.each do |comment|
  count = rand(1..3)
  count.times do
    c = comment.comments.create(body: Faker::Hipster.paragraph)
    c.user = User.order("RANDOM()").first
    c.save
  end
end
#  adding the sort_column to the Conversations in the db
# Conversation.all.each do |convo|
#   convo.sort_column = convo.comments.last.created_at
#   convo.save
# end
