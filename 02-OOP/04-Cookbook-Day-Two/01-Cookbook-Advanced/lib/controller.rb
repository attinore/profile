require_relative "view"
require_relative "recipe"
require_relative "cookbook"
require_relative "scrape_service"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # USER ACTIONS

  def list
    display_recipes
  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(recipe)
    display_recipes
  end

  def destroy
    # 1. Display recipes
    display_recipes
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove_recipe(index)
    # 4. Display
    display_recipes
  end

  def import_recipe
    keyword = @view.ask_user_for("keyword")
    results = ScrapeService.new(keyword).call
    @view.display(results)
    index = @view.ask_user_for_index
    @cookbook.add_recipe(results[index])
    display_recipes
  end

  def mark_as_done
    display_recipes
    index = @view.ask_user_for_index
    @cookbook.mark_recipe_as_done(index)
    display_recipes
  end

  private

  def display_recipes
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
