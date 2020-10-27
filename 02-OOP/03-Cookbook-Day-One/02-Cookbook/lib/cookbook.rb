require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'lib/recipes.csv'

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row['Name']}, a #{row['Description']}"
end

# Save
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'lib/recipes.csv'

CSV.open(filepath, 'wb', csv_options) do |csv|
end

class Cookbook
  def initialize
    @recipes = []
  end
  # all which returns all the recipes
  def all
    return @recipes
  end

  # add_recipe(recipe) which adds a new recipe to the cookbook
  def add_recipe(recipe)
    return @recipes << recipe
  end

  # remove_recipe(recipe_index) which removes a recipe from the cookbook.
  def remove_recipe(recipe_index)
    return @recipes.delete_at(recipe_index)
  end
end
