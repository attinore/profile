require_relative 'cookbook'
require_relative 'recipe'

class View
  def display(recipes)
    @recipes = recipes
    @recipes.each do |recipe|
      puts "#{recipe.name}, #{recipe.description}"
    end
  end
end
