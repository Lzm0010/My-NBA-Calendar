class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    

    def favorite_teams
        
    end
    
    def add_a_favorite_team
    
    end
    
    def edit_a_favorite_team
    
    end

    def delete_team

    end
end