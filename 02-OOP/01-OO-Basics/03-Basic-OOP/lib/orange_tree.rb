class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  attr_accessor :age, :height, :fruits

  def dead?
    @dead
  end

  def probability_of_dying
    if @age >= 100
      @dead = true
    elsif @age < 50
      @dead = false
    elsif @age > 50 && @age < 100
      @age += rand(0.0..1.0)
    end
  end

  def one_year_passes!
    @age += 1
    @fruits = 0
    @height += 1 if @age <= 10

    if @age > 5 && @age < 10
      @fruits += 100
    elsif @age >= 10 && @age < 15
      @fruits += 200
    end

    probability_of_dying
  end

  def pick_a_fruit!
    @fruits -= 1 unless @fruits.zero?
  end
end
