require_relative '../config/environment'

User.delete_all
UserTeam.delete_all
Team.delete_all

### CREATE USERS ###

User.create(user_name: "Leemac33", 
            full_name: "Lee McCormick",
            location: "Charlotte")
User.create(user_name: "dlee", 
            full_name: "David Lee",
            location: "Philadelphia")
User.create(user_name: "Kobe824", 
            full_name: "Kobe Bryant",
            location: "Los Angeles")

### CREATE TEAMS ###

nba = NbaApiCommunicator.new
teams_hash = nba.make_api_request_get_json("/teams/league/standard")
nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}
nba_teams.each_with_index do |team, i|
    Team.create(name: team["fullName"], 
                city: team["city"], 
                conference: team["leagues"]['standard']['confName'],
                division: team["leagues"]["standard"]["divName"],
                logo: team['logo'],
                api_id: team['teamId'])

    ### CREATE PLAYERS FOR TEAM ###
    
    players_hash = nba.make_api_request_get_json("players/teamId/#{team["teamId"]}")
    active_players = players_hash["api"]["players"].select do |player| 
        if player["leagues"]["standard"] != nil
            player["leagues"]["standard"]["active"] == "1"
        end
    end
    active_players.each do |player| 
        Player.create(name: "#{player['firstName']} #{player['lastName']}",
                      college: player["collegeName"],
                      team_id: i+1,
                      age: player["dateOfBirth"].to_date,
                      number: player["leagues"]["standard"]["jersey"],
                      position: player["leagues"]["standard"]["pos"],
                      height: player["heightInMeters"].to_f,
                      weight: "#{player['weightInKilograms'].to_f/ 0.45359237}",
                      start_nba: player["startNba"])
    end

end


### CREATE USER TEAMS ###

UserTeam.create(user_id: 1, team_id: 11)
UserTeam.create(user_id: 2, team_id: 23)
UserTeam.create(user_id: 3, team_id: 14)
UserTeam.create(user_id: 1, team_id: 19)

