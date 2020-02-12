class Team < ActiveRecord::Base
    has_many :user_teams
    has_many :users, through: :user_teams
    
    @@nba = NbaApiCommunicator.new

    def last_five(team_id)
        @@nba.make_api_request_get_json("game/#{teamid}")

    end
    
    def next_five(team_id)
    
    end

    def players(team_id)
        ## show list of teams with their matching team(api) ids
        team_players_hash = @@nba.make_api_request_get_json("players/teamid/#{string_id}")



    end

end




#hi