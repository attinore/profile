require_relative "../models/meal"


class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
  end

  def add
    # name = @view.ask_user_for("name")
    # # 2. Ask user for a description (view)
    # description = @view.ask_user_for("description")
    # # 3. Ask user for rating (view)
    # rating = @view.ask_user_for("rating")
    # # 4. Ask user for prep time (view)
    # prep_time = @view.ask_user_for("prep_time")
    # # 5. Create recipe (model)
    # recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    # # 6. Store in cookbook (repo)
    # @cookbook.add(recipe)
    # # 7. Display
    # display_recipes
  end

  def list
    # display_recipes
  end
end
