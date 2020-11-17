require "faker"

100.times do
  post = Post.new(
    title: Faker::Movies::HarryPotter,
    url: Faker::Internet.url(host: 'example.com'),
    votes: rand(0..10)
  )
  post.save!
end
# TODO: Write a seed to insert 100 posts in the database
