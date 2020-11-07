require "csv"
require_relative "../models/order"

class OrderSpository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @orders = []
    @next_id = 1
    @meal_repository = Meal.new
    @customer_repository = Customer.new
    @employee_repository = Employee.new
    load_csv if File.exist?(@csv_file)
  end

  def create(order)
    meal.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def undelivered_orders
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id meal customer deliver]
      @orders.each do |order|
        csv << [order.id, order.meal, order.customer, order.delivered]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end
