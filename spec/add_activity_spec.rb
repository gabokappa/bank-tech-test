require 'account'
describe Account do
  subject(:account) { described_class.new }
  describe ' #add_activity' do
    context 'The balance has been set to 20' do
      before(:each) do
        account.instance_variable_set(:@balance, 20)
        @t = Time.now.strftime('%d/%m/%Y')
      end
      it 'adds a deposit event as a formatted string into the activity array' do
        account.send(:add_activity, 20, 'deposit')
        expect(account.activity).to eq ["#{@t} || 20.00 || || 20.00"]
      end

      it 'adds a formatted string into the activity array for withdraw event' do
        account.send(:add_activity, 10, 'withdraw')
        expect(account.activity).to eq ["#{@t} || || 10.00 || 20.00"]
      end
    end
  end
end
