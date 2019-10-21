require 'account'
describe Account do
  subject(:account) { described_class.new }
  describe ' #withdraw' do
    it 'takes funds away from the balance' do
      account.withdraw(10)
      expect(account.balance).to eq(-10)
    end

    it 'stores the timestamp, the withdrawn amount and balance' do
      t = Time.now.strftime('%d/%m/%Y')
      account.withdraw(10)
      expect(account.activity).to eq ["#{t} || || 10.00 || -10.00"]
    end
  end
end
