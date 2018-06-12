class Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date

    def initialize
        @pin_code = rand(1000..9999)
        @balance = 0
        @account_status = :active
        @exp_date = '07/18'
    end

end