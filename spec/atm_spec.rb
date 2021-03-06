require './lib/atm.rb'
require 'Date'

describe Atm do
    let(:account) { instance_double('Account', pin_code: '1234', exp_date: '07/18', condition: :active)}

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end

    it 'allow withdraw if account has enough balance.' do
        expected_output = {status: true, message: 'Success', date: Date.today, amount: 45, bills: [20, 20, 5]}
        expect(subject.withdraw(45, '1234', account, :active)).to eq expected_output
    end
    
    it 'has 1000$ on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'funds are reduced at withdraw' do
        subject.withdraw(50, '1234', account, :active)
        expect(subject.funds).to eq 950
    end

    it 'rejects withdraw if account has insufficient funds' do
        expected_output = {status: false, message: 'Insufficient funds', date: Date.today}
        expect(subject.withdraw(105, '1234', account, :active)).to eq expected_output
    end

    it 'rejects withdraw if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = {status: false, message: 'Insufficient funds in ATM', date: Date.today}
        expect(subject.withdraw(100, '1234', account, :active)).to eq expected_output
    end

    it 'rejects withdraw if pin is wrong' do
        expected_output = { status: false, message: 'Wrong pin code', date: Date.today}
        expect(subject.withdraw(50, '9999', account, :active)).to eq expected_output
    end

    it 'rejects withdraw if card is expired' do
        allow(account).to receive(:exp_date).and_return('12/15')
        expected_output = { status: false, message: 'Card expired', date: Date.today}
        expect(subject.withdraw(6, '1234', account, :active)).to eq expected_output
    end
    
    it 'rejects if account is not active' do
        expected_output = { status: false, message: 'Account disabled', date: Date.today}
        expect(subject.withdraw( 0 , '1234', account, :disabled))
    end   
end