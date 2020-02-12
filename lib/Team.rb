class Team < ActiveRecord::Base
    has_many :user_teams
    has_many :users, through: :user_teams
    
    @@nba = NbaApiCommunicator.new

    def select_team

    end

    def last_five
        teams_game = @@nba.make_api_request_get_json("game/#{self.id}")
        ap teams_game
    end
    
    def next_five
    
    end


end