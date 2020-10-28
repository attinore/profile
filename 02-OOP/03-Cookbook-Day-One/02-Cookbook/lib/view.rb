class View
  def display(recipes)
    recipes.each do |name|
      puts "/.*(#{name}.*/"
    end
  end
end
