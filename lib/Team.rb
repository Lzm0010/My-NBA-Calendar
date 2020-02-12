class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams
    
    @@nba = NbaApiCommunicator.new

    def last_five
        today = Time.now.utc
        current_season_games = self.get_season_games
        previous_five_games = current_season_games.select{|game| game["startTimeUTC"] < today}.last(5)
        previous_five_games.each do |game|
            ap "#{game["vTeam"]["fullName"]} #{game["vTeam"]['score']["points"]} - #{game["hTeam"]["fullName"]} #{game["hTeam"]['score']["points"]}"
        end
    end
    
    def next_five
        today = Time.now.utc
        current_season_games = self.get_season_games
        next_five_games = current_season_games.select{|game| game["startTimeUTC"] > today}.first(5)
        next_five_games.each do |game|
            ap "#{game["vTeam"]["fullName"]} @ #{game["hTeam"]["fullName"]} #{game['startTimeUTC'].to_datetime.localtime("-05:00").strftime("%m/%d/%Y %I:%M %p")}"
        end
    end

    ### HELPER METHODS
    def get_season_games
        teams_games = @@nba.make_api_request_get_json("games/teamId/#{self.api_id}")#?seasonYear=2019")
        teams_games['api']['games'].select{|game| game['seasonYear'] == "2019"}
    end
end




