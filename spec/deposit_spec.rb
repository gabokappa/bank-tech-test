require 'account'
describe ' #deposit' do
  let(:account) { Account.new }
  it 'deposits money into the balance' do
    account.deposit(10)
    expect(account.balance).to eq(10)
  end

  it 'can make more than one deposit and this also changes the balance' do
    account.deposit(1000)
    account.deposit(930)
    expect(account.balance).to eq(1930.00)
  end

  it 'stores the date, the deposit and the balance' do
    t = Time.now.strftime('%d/%m/%Y')
    account.deposit(10)
    expect(account.activity).to eq ["#{t} || 10.00 || || 10.00"]
  end
end
