class Account
  attr_reader :balance, :activity

  def initialize(overdraft = -100)
    @balance = 0
    @activity = []
    @overdraft = overdraft
  end

  def deposit(amount)
    @balance += amount.to_f
    add_activity(amount, 'deposit')
  end

  def withdraw(amount)
    raise 'ERROR overdraft limit reached' if @balance - amount < @overdraft

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
    amount_string = format('%<decimals>.2f', decimals: amount)
    balance_string = format('%<decimals>.2f', decimals: @balance)
    if event == 'deposit'
      @activity.push("#{d} || #{amount_string} || || #{balance_string}")
    else
      @activity.push("#{d} || || #{amount_string} || #{balance_string}")
    end
  end
end
