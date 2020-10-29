require_relative 'view'
require_relative 'cookbook'


class Controller
  def initilaize(cookbook)
    @cookbook = Cookbook.new(csv_file)
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @cookbook.remove_recipe(recipe_index)
  end
end
