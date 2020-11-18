require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
post = RestClient.get("https://hacker-news.firebaseio.com/v0/topstories.json", headers = {})
stories = JSON.parse(post)
10.times do
  stories = Post.new
  stories.save!
  p stories
end
