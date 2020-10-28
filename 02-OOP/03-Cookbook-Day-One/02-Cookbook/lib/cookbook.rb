require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    CSV.foreach(csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
  # all which returns all the recipes

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end


  private

  def save_to_csv
    csv_file_path = "lib/recipe.csv"
    CSV.open(csv_file_path, 'w') do |csv|
      csv << [@recipes[0].to_s, @recipes[1].to_s]
    end
  end
end
