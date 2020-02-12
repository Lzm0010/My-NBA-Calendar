class Player < ActiveRecord::Base
    belongs_to :team


    # def age
    #     now = Time.now.utc.to_date
    #     now.year - self.age.year - ((now.month > self.age.month || (now.month == self.age.month && now.day >= self.age.day)) ? 0 : 1)
    # end


end