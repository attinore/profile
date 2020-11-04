class MealView
  def ask_action(stuff)
    puts "#{stuff}?"
    print "> "
    return gets.chomp
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}) #{meal.name}: #{meal.price}yen."
    end
  end
end
