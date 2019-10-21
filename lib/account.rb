class Account
attr_reader :balance


  def deposit(ammount)
    @balance = ammount
  end

  def withdraw(ammount)
    @balance =- ammount
  end

end