require_relative "../views/customer_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def add
    name = @customer_view.ask_action("name")
    address = @customer_view.ask_action("address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def list
    display_customers
  end

  private

  def display_customers
    customers = @customer_repository.all
    @customer_view.display(customers)
  end
end
