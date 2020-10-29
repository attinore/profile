require_relative 'view'
# require_relative 'cookbook'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    name = @view.ask_name
    description = @view.ask_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    number = @view.ask_delete
    @cookbook.remove_recipe(number)
  end
end
