class Player < ActiveRecord::Base
    belongs_to :team

    def fun_stats

    end

    def age_calculated
       
            dob = self.age
            now = Date.today
            age = now.year - dob 


            # now.year - self.age.year - ((now.month > self.age.month || (now.month == self.age.month && now.day >= self.age.day)) ? 0 : 1)
    
    end


end