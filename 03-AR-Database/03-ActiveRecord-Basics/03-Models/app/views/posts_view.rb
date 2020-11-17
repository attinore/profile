class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def ask_user_for(stuff)
    puts "Input #{stuff}?"
    print "> "
    return gets.chomp
  end

  def display_all(posts)
    posts.each do |post|
      puts "#{post.id}: #{post.title} (#{post.url}) - #{post.votes} vote(s))"
    end
  end
end
