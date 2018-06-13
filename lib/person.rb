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
end