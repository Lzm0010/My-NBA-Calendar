class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams
    
    @@nba = NbaApiCommunicator.new

    def last_five
        today = Time.now.utc
        teams_games = @@nba.make_api_request_get_json("games/teamId/#{self.api_id}")#?seasonYear=2019")
        current_season = teams_games['api']['games'].select{|game| game['seasonYear'] == "2019"}
        previous_five_games = current_season.select{|game| game["startTimeUTC"] < today}.last(5)
        previous_five_games.each do |game|
            ap "#{game["vTeam"]["fullName"]} #{game["vTeam"]['score']["points"]} - #{game["hTeam"]["fullName"]} #{game["hTeam"]['score']["points"]}"
        end
    end
    
    def next_five
    
    end

   

end




