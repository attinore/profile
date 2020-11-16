require_relative "../models/post"
require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    posts = Post.all
    @view.display_all(posts)
    # TODO: implement listing all posts
  end

  def create
    title = @view.ask_user_for("title")
    url = @view.ask_user_for("url")
    # TODO: implement creating a new post
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    index
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    post.title = @view.ask_user_for("new title")
    post.url = @view.ask_user_for("new url")
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    index
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
