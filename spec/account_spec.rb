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

  describe "#print_statement" do
    it "prints out account statement in a specific format" do
      expect { account.print_statement }. to output("date || credit || debit || balance\n").to_stdout
    end
  end



end