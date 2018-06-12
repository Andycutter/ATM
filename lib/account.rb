class Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date

    STD_VLD_YRS = 5

    def initialize
        @pin_code = rand(1000..9999)
        @balance = 0
        @account_status = :active
        @exp_date = Date.today.next_year(Account::STD_VLD_YRS).strftime('%m/%y')
    end

end