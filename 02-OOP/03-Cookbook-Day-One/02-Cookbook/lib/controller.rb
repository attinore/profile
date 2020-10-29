require_relative 'view'
require_relative 'cookbook'
require_relative 'recipe'


class Controller
  def initilaize(cookbook)
    @cookbook = Cookbook.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @cookbook.remove_recipe
  end
end
