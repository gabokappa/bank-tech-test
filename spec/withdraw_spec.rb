require 'account'
describe ' #withdraw' do
  let(:account) { Account.new }
  it 'takes funds away from the balance' do
    account.withdraw(10)
    expect(account.balance).to eq(-10)
  end

  it 'can make more than one withdraw and this also changes the balance' do
    account.withdraw(10)
    account.withdraw(30)
    expect(account.balance).to eq(-40.00)
  end

  it 'raises an error if the withdraw goes over the overdraft limit' do
    expect { account.withdraw(101) }.to raise_error 'ERROR overdraft limit reached'
  end

  it 'stores the date, the withdrawn amount and balance' do
    t = Time.now.strftime('%d/%m/%Y')
    account.withdraw(10)
    expect(account.activity).to eq ["#{t} || || 10.00 || -10.00"]
  end
end
