class Account
  attr_reader :balance, :activity

  def initialize
    @balance = 0
    @activity = []
  end

  def deposit(amount)
    @balance += amount.to_f
    add_activity(amount, 'deposit')
  end

  def withdraw(amount)
    @balance -= amount.to_f
    add_activity(amount, 'withdraw')
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @activity.reverse.each { |event| puts event }
  end

  private

  def add_activity(amount, event, date = Time.now)
    d = date.strftime('%d/%m/%Y')
    amount_string = format('%<digits>.2f', digits: amount)
    balance_string = format('%<digits>.2f', digits: @balance)
    if event == 'deposit'
      @activity.push("#{d} || #{amount_string} || || #{balance_string}")
    else
      @activity.push("#{d} || || #{amount_string} || #{balance_string}")
    end
  end
end
