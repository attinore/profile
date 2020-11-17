require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    posts = Post.all
    @view.display_all(posts)
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
  end

  def create
    title = @view.ask_user_for("title")
    url = @view.ask_user_for("url")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    index
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    post.title = @view.ask_user_for("new title")
    post.url = @view.ask_user_for("new url")
    post.save
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
  end

  def destroy
    index
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    Post.destory
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
  end

  def upvote
    id = @view.ask_user_for("id").to_i
    post = Post.find(id)
    post.increment!(:votes, 1)
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
  end
end
