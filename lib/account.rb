class Account
    attr_accessor :pin_code, :exp_date, :balance, :account_status

    STD_VLD_YRS = 5

    def initialize
        @pin_code = generate_pin
        @exp_date = Date.today.next_year(Account::STD_VLD_YRS).strftime('%m/%y')
        @balance = 0
        @account_status = :active
        
    end

    private

    def generate_pin
        rand(1000..9999)
    end


end