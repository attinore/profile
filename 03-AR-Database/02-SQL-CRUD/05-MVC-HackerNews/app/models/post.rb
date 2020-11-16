class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts WHERE id = ?", id)[0]
    p posts
    p posts.class
    if posts == []
      nil
    else
      Post.new(id: posts["id"].to_i, title: posts["title"], url: posts["url"], votes: posts["votes"].to_i)
    end
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts")
    posts.map do |post|
      Post.new(id: post["id"], title: post["title"], url: post["url"], votes: post["votes"])
    end
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)", @url, @votes, @title)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET url = ?, votes = ?, title = ? WHERE id = ?", @url, @votes, @title, @id)
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ? ", @id)
  end
end
