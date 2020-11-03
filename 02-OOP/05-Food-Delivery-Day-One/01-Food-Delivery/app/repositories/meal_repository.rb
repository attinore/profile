require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @meals = []
    @next_id = 1
    @csv_file = csv_file
    load_csv if File.exist?(csv_file)
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find(id)
    @meals.find do |meal|
      meal.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
