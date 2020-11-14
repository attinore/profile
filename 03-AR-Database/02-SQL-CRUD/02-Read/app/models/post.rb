# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts WHERE id = ?", id)[0]
    if !posts.nil?
      Post.new(posts.transform_keys! { |key| key.to_sym })
    else
      posts.nil?
      nil
    end
  end

  def self.all
    posts = DB.execute("SELECT * FROM posts")
    p posts
    if !posts.nil?
      posts.map do |post|
        post = Post.new(id: post["id"], title: post["title"], url: post["url"], votes: post["votes"])
        p post
      end
    else
      []
    end
  end

  # def self.all
  #   posts = DB.execute("SELECT * FROM posts")
  #   p posts
  #   if !posts.nil?
  #     posts.to_a
  #       p posts
  #   else
  #     []
  #   end
end



# def self.find(id)
#     query = <<-SQL
#     SELECT * FROM posts
#     WHERE id = #{id.to_i}
#     SQL

#     row = DB.execute(query).flatten
#     if row.empty?
#       return nil
#     else
#       return Post.new(id: posts[0], url: posts[1], votes: posts[2], title: posts[3])
#     end
# end
