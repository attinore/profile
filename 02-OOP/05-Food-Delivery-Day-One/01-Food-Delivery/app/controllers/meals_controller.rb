require_relative "../views/meal_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    name = @meal_view.ask_action("name")
    price = @meal_view.ask_action("price")
    meal = Meal.new(name: name, price: price.to_i)
    @meal_repository.create(meal)
  end

  def list
    display_meals
  end

  private

  def display_meals
    meals = @meal_repository.all
    @meal_view.display(meals)
  end
end
