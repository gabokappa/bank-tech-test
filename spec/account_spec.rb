require 'account'
describe Account do
  subject(:account) { described_class.new }

  describe ' #deposit' do
    it 'deposits money into the balance' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'stores the timestamp and amount of the deposit' do
      account.deposit(10)
      expect(account.activity).to eq ["21/10/2019 || 10.00 || || 10.00"]
    end
  end

  describe ' #withdraw' do
    it 'takes funds away from the balance' do
      account.withdraw(10)
      expect(account.balance).to eq(-10)
    end

    it 'stores the timestamp the balance withdraw ' do
      account.withdraw(10)
      t = Time.now.strftime('%d/%m/%Y')
      expect(account.activity).to eq ["#{t} || || 10.00 || -10.00"]
    end
  end

  describe 'balance changes' do
    it 'correctly changes the balance ammount based on events' do
      account.deposit(1000)
      account.withdraw(930.50)
      expect(account.balance).to eq(69.50)
    end
  end

  describe ' #print_statement' do
    it 'prints out a statement header in a specific format' do
      expect { account.print_statement }. to output("date || credit || debit || balance\n").to_stdout
    end

    it 'prints out a statement with a header and event' do
      account.deposit(100)
      expect { account.print_statement }. to output("date || credit || debit || balance
21/10/2019 || 100.00 || || 100.00\n").to_stdout
    end

    it 'prints out a statement with the most recent event at the top' do
      account.deposit(100)
      account.withdraw(10)
      expect { account.print_statement }. to output("date || credit || debit || balance
21/10/2019 || || 10.00 || 90.00
21/10/2019 || 100.00 || || 100.00\n").to_stdout
    end
  end

end