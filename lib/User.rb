class User < ActiveRecord::Base
    has_many :userteams
    has_many :teams, through: :userteams

    def favorite_teams
    
    end
    
    def add_a_favorite_team
    
    end
    
    def edit_a_favorite_team
    
    end

    def delete_team

    end
end