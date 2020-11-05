class CustomerView
  def ask_action(stuff)
    puts "#{stuff}?"
    print "> "
    return gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}) #{customer.name}'s address is: #{customer.address}yen."
    end
  end
end
