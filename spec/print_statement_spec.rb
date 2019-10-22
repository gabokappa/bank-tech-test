require 'account'
describe ' #print_statement' do
  let(:account) { Account.new }
  context 'the statement has a formatted header' do
    before(:each) do
      @date = Time.now.strftime('%d/%m/%Y')
      @header = "date || credit || debit || balance\n"
    end

    it 'prints out a statement header in a specific format' do
      expect { account.print_statement }. to output(@header).to_stdout
    end

    it 'prints out a statement with a header and event' do
      account.deposit(100)
      deposit = "#{@date} || 100.00 || || 100.00\n"
      expect { account.print_statement }. to output("#{@header}#{deposit}").to_stdout
    end

    it 'prints out a statement with the most recent event at the top' do
      account.deposit(100)
      account.withdraw(10)
      deposit = "#{@date} || || 10.00 || 90.00\n"
      withdraw = "#{@date} || 100.00 || || 100.00\n"
      expect { account.print_statement }. to output(@header + deposit + withdraw).to_stdout
    end
  end
end
