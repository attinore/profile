require_relative "../views/orders_view"
require_relative "../views/customers_view"
require_relative "../views/meals_view"
require_relative "../views/sessions_view"
require_relative "../models/order"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @sessions_view = SessionsView.new
    @customers_view = CustomersView.new
  end

  def add
    # get the meal from the meal repo
    @meals = @meal_repository.all
    #display to the user (MealsView)
    @meals_view.display(meals)
    #ask for index
    index = @orders_view.ask_for_index
    #store the selected meal in a variable
    meal = meals[index]

    # get the customer from the customer repo
    #display to the user (customersView)
    #ask for index
    #store the selected customer in a variable

    # get the Employee from the Employee repo
    #display to the user (EmployeesView)
    #ask for index
    #store the selected Employee in a variable

    # create an order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # save it to (OrderRepo)
    @order_repository.create(order)
    # Show the list of orders
    list_undelivered
  end

  def list_undelivered_orders
    #get the undelivered orders from the OrderRepo
    @order = @order_repository.undelivered_orders #array of all the undelivered orders
    #display the list of orders in the view
    @orders_view.display_orders(orders)
  end

end
