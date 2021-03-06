require './lib/account.rb'

class Person
    attr_accessor :name, :cash, :account

    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil
    end

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(amount)
        @account == nil ? missing_account : deposit_cash(amount)
    end

    def retrieve_cash(args = {})
        @account == nil ? missing_account : withdraw_funds(args)
    end

    
    private

    
    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin = args[:pin]
        response = atm.withdraw(amount, pin, account, atm)
        response[:status] == true ? increase_cash(response) : response
    end

    def deposit_cash(amount)
        @cash -= amount
        @account.balance += amount
    end
 
    def increase_cash(response)
        @cash += response[:amount]
    end

    def missing_account
        raise 'No account present'
    end

    def missing_atm
        raise 'An ATM is required'
    end

    def missing_name
        raise "A name is required"
    end
end