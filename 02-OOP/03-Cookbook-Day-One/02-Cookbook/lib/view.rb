require_relative 'cookbook'
require_relative 'recipe'

class View
  def display(recipes)
    @recipes = recipes
    @recipes.each do |recipe|
      puts "#{recipe.name}, #{recipe.description}"
    end
  end

  def ask_name
    puts "What's your recipe?"
    return gets.chomp
  end

  def ask_description
    puts "Describe how to make it."
    return gets.chomp
  end

  def ask_delete
    puts "Choose a number to delete."
    return gets.chomp.to_i
  end
end
