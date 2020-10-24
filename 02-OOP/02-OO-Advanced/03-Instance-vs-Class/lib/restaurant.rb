class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :city, :name, :average_rating

  def initialize(city, name)
    @city = city
    @name = name
    @rating = []
    # TODO: implement constructor with relevant instance variables
  end

  def rate(new_rate)
    # re-compute the restaurant average rating @average_rating
    @rating << new_rate
    @average_rating = @rating.sum(0.0) / @rating.length
  end

  def self.filter_by_city(restaurants, city)
    filtered_restaurant = restaurants.select { |restaurant| restaurant.city == city }
    return filtered_restaurant
  end
end
