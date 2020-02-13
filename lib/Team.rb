class Team < ActiveRecord::Base
    has_many :players
    has_many :user_teams
    has_many :users, through: :user_teams
    
    @@nba = NbaApiCommunicator.new
    @@prompt = TTY::Prompt.new

    def select_a_player
        player_id = self.get_player_id("Select a player:")
        Player.find(player_id)
    end

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

    def leaders
        self.players.each do |player|
            player_stats = @@nba.make_api_request_get_json("statistics/players/playerId/#{player.api_id}")
            points = 0
            assists = 0
            rebounds = 0
            player_stats["api"]["statistics"].last(10).each do |game| 
                points += game["points"].to_i 
                assists += game['assists'].to_i 
                rebounds += game['totReb'].to_i
            end
            puts "#{player.name} is averaging #{points/10.0}ppg #{assists/10.0}apg & #{rebounds/10.0}rpg"
        end
    end

    ### HELPER METHODS
    def get_season_games
        teams_games = @@nba.make_api_request_get_json("games/teamId/#{self.api_id}")#?seasonYear=2019")
        teams_games['api']['games'].select{|game| game['seasonYear'] == "2019"}
    end

    def get_player_id(prompt)
        player_id = @@prompt.select(prompt) do |menu|
            self.players.each do |player|
                menu.choice player.name, player.id
            end
        end
        player_id
    end 
end




