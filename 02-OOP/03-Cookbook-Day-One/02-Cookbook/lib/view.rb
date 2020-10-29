class View
  def display(name, description)
    @recipes.each do |name, description|
    puts "#{name}, #{description}"
    end
  end
end
