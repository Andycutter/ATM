require './lib/account.rb'

class Person
    attr_accessor :name, :cash, :account

    def initialize(attrs = {})
        @cash = 0
        @name = set_name(attrs[:name])
        @account = nil
    end

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(amount)
        @account == nil ? missing_account : deposit_cash(amount)
    end

    def withdraw(args = {})
        @account == nil ? missing_account : withdraw_funds(args)
    end

    private

    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "A name is required"
    end

    def deposit_cash(amount)
        @cash -=amount
        @account.balance += amount
    end

    def missing_account
        raise 'No account present'
    end

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin_code = args[:pin_code]
        response = atm.withdraw(amount, pin_code, account, atm)
        response[:status] == true ? increase_cash(response) : response
    end

    def missing_atm
        raise 'An ATM is required'
    end

    def increase_cash(response)
        @cash += reponse[:amount]
    end
end