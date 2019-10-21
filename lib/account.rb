class Account
attr_reader :balance

  def initialize
    @balance = 0
    @activity = []
  end

  def deposit(ammount)
    @balance = ammount
  end

  def withdraw(ammount)
    @balance =- ammount
  end

  def print_statement
    puts "date || credit || debit || balance"
  end

end