class Order
  attr_reader :employee, :meal, :customer
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false #if you are not passing any variable, then gives "false"
  end

  def delivered? #= attr_accessor
    @delivered # just giving a status
  end

  def deliver! #= attr_accessor
    @delivered = true #overwrite anything
  end
end
