require_relative '../config/environment'
nba = NbaApiCommunicator.new
teamid = "14"
players_hash = nba.make_api_request_get_json("players/teamId/#{teamid}")
    active_players = players_hash["api"]["players"].select{|player| 
    if player["leagues"]["standard"] != nil
        player["leagues"]["standard"]["active"] == "1"
    end
    }
players = Player.all
bembry = players[0] 

<<<<<<< HEAD

string_to_date = "1996-12-02".to_date
binding.pry
### PLAYER UPDATES ###
# update age to show, 
# height to convert to feet and inches, 
# start_nba to calculate years and months into NBA
=======
>>>>>>> 146bad13ac7c126f58d9523cd63c6a3940ac05c0

welcome
