class Account
attr_reader :balance, :activity

  def initialize
    @balance = 0
    @activity = []
  end

  def deposit(amount)
    t = Time.now.strftime('%d/%m/%Y')
    @balance += amount.to_f
    @activity.push("#{t} || #{sprintf("%.2f", amount)} || || #{sprintf("%.2f", @balance)}")
  end

  def withdraw(amount)
    @balance =- amount
  end

  def print_statement
    puts "date || credit || debit || balance"
  end

end