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

  def add_activity(amount, event, time = Time.now)
    t = time.strftime('%d/%m/%Y')
    if event == 'deposit'
      @activity.push("#{t} || #{format('%<digits>.2f', digits: amount)} || || #{format('%<digits>.2f', digits: @balance)}")
    else
      @activity.push("#{t} || || #{format('%<digits>.2f', digits: amount)} || #{format('%<digits>.2f', digits: @balance)}")
    end
  end
end
