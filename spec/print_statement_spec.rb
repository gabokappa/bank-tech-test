require 'account'
describe Account do
  subject(:account) { described_class.new }

  describe ' #print_statement' do
    context 'the statement has a formatted header' do
      before(:each) do
        @header = "date || credit || debit || balance\n"
      end

      it 'prints out a statement header in a specific format' do
        expect { account.print_statement }. to output(@header).to_stdout
      end

      it 'prints out a statement with a header and event' do
        account.deposit(100)
        deposit = "21/10/2019 || 100.00 || || 100.00\n"
        expect { account.print_statement }. to output("#{@header}#{deposit}").to_stdout
      end

      it 'prints out a statement with the most recent event at the top' do
        account.deposit(100)
        account.withdraw(10)
        deposit = "21/10/2019 || || 10.00 || 90.00\n"
        withdraw = "21/10/2019 || 100.00 || || 100.00\n"
        expect { account.print_statement }. to output(@header + deposit + withdraw).to_stdout
      end
    end
  end
end
