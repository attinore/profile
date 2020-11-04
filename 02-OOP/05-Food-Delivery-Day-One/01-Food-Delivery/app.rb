# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "../app/repositories/meal_repository"
require_relative "../app/controller/meals_controller"
require_relative "router"

CSV_FILE = File.join(File.dirname(__FILE__), "meals.csv")
meal_repository = MealRepository.new(CSV_FILE)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)

# Start the app
router.run
