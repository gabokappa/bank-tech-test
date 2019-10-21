require 'account'
describe Account do
  describe ' #deposit' do
    it 'deposits money into the balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'stores the timestamp, the deposit and the balance' do
      t = Time.now.strftime('%d/%m/%Y')
      account.deposit(10)
      expect(account.activity).to eq ["#{t} || 10.00 || || 10.00"]
    end
  end

  describe 'balance changes' do
    it 'correctly changes the balance ammount based on events' do
      account.deposit(1000)
      account.withdraw(930.50)
      expect(account.balance).to eq(69.50)
    end
  end
end
