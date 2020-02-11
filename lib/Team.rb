class Team < ActiveRecord::Base
    has_many :user_teams
    has_many :users, through: :user_teams

    def team_standings

    end

    def last_five

    end
    
    def next_five
    
    end
end