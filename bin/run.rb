require_relative '../config/environment'
@@nba = NbaApiCommunicator.new

id = 1
team_hash = @@nba.make_api_request_get_json("players/teamId/#{id}")
ap players_array = team_hash["api"]["players"]

binding.pry

welcome
