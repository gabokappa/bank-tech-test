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
    header = "date || credit || debit || balance"
    if @activity.length == 0
      puts header
    else
      puts header
      @activity.reverse.each { |event| puts event }
    end
  end
end
