# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)


  attr_reader :name, :balance

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    @balance -= amount
    # TODO: returns a string with a message
    "#{amount} was withdrawed from your account. Your balance is #{balance}."
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    @balance += amount
    # TODO: returns a string with a message
    "#{amount} was deposited to your account. Your balance is #{balance}."
  end

  def transactions_history(args = {})
    password = args[:password]
    if password.nil?
      "enter your password"
    elsif password != @password
      "incorrect password"
    else
      @transactions.join(',')
    end
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    iban = @iban.split("-")
    "#{iban[0]}********************#{iban[6]}"
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    "Owner: #{name} - IBAN: #{iban} - Balance: #{balance}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << amount
    # TODO: update the current balance (which represents the balance of the account)
    @balance += amount
  end
end
