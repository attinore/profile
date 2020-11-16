class PostsView
  def ask_user_for(stuff)
    puts "provide information for #{stuff}"
    print "> "
    return gets.chomp
  end

  def display_all(posts)
    # TODO: implement methods called by the PostsController
    posts.each do |post|
      puts "#{post.id} - #{post.title} (#{post.votes} vote(s))"
    end
  end
end
