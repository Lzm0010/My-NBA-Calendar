class Team < ActiveRecord::Base
    has_many :userteams
    has_many :users, through: :userteams

    def team_standings

    end

    def last_five

    end
    
    def next_five
    
    end
end