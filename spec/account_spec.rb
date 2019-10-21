require 'account'
describe Account do
  subject(:account) { described_class.new }

  describe "#deposit" do
    it "deposits money into the balance" do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end
  end

  describe "#withdraw" do
    it "takes funds away from the balance" do
      account.withdraw(10)
      expect(account.balance).to eq(-10)
    end
  end

end