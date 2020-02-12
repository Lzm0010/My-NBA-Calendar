class Team < ActiveRecord::Base
    has_many :players
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

    def players(team_id)
        ## show list of teams with their matching team(api) ids
        team_players_hash = @@nba.make_api_request_get_json("players/teamid/#{string_id}")



    end

end




