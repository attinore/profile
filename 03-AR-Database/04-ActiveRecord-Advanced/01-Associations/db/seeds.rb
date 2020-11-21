require "faker"

5.times do
  user = User.new
  user.username = Faker::Name.unique.name
  user.email = Faker::Internet.email
  user.save!
  (5..10).to_a.sample.times do
    post = Post.new(
      title: Faker::Movies::HarryPotter,
      url: Faker::Internet.url(host: 'example.com'),
      user: user
    )
    post.save!
  end
end
