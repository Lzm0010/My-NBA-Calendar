require_relative '../config/environment'

User.delete_all
UserTeam.delete_all
Team.delete_all

User.create(user_name: "Leemac33", 
            full_name: "Lee McCormick",
            location: "Charlotte")
User.create(user_name: "dlee", 
            full_name: "David Lee",
            location: "Philadelphia")
User.create(user_name: "Kobe824", 
            full_name: "Kobe Bryant",
            location: "Los Angeles")


nba = NbaApiCommunicator.new
teams_hash = nba.make_api_request_get_json("/teams/league/standard")
nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}
nba_teams.each do |team|
    Team.create(name: team["fullName"], 
                city: team["city"], 
                conference: team["leagues"]['standard']['confName'],
                division: team["leagues"]["standard"]["divName"],
                logo: team['logo'])
end

#standings
standings_hash = nba.make_api_request_get_json("/standings/standard/2019")
standings = standings_hash["api"]


UserTeam.create(user_id: 1, team_id: 11)
UserTeam.create(user_id: 2, team_id: 23)
UserTeam.create(user_id: 3, team_id: 14)
UserTeam.create(user_id: 1, team_id: 19)

