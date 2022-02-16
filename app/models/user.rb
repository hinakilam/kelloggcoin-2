class User < ApplicationRecord
    def balance
        coins_received = Transaction.where({ to_user_id: self.id }).sum(:amount)
        coins_given = Transaction.where({from_user_id: self.id}).sum(:amount)
        coins_received - coins_given
    end 
end

