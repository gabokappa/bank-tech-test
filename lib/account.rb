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
    t = Time.now.strftime('%d/%m/%Y')
    @balance -= amount.to_f
    @activity.push("#{t} || || #{sprintf("%.2f", amount)} || #{sprintf("%.2f", @balance)}")
  end

  def print_statement
      puts "date || credit || debit || balance"
      @activity.reverse.each { |event| puts event }
  end

  def add_activity(amount, event)
    t = t = Time.now.strftime('%d/%m/%Y')
    if event == 'deposit'
      @activity.push("#{t} || #{sprintf("%.2f", amount)} || || #{sprintf("%.2f", @balance)}")
    end
  end
end
