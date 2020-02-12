require_relative '../config/environment'


# nba = NbaApiCommunicator.new

# teams_hash = nba.make_api_request_get_json("/teams/league/standard")
# nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}
# teams_with_api_id_hash = {}
# nba_teams.each{|team|teams_with_api_id_hash[team["fullName"]] = team["teamId"]}

# east_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/east")
# east_teams = east_standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
# east_teams_ranked = {}
# east_teams.each{|team|east_teams_ranked[team["teamId"]] = team["conference"]["rank"]} #api_teamId = rank

# east_hash = {}
# teams_with_api_id_hash.each {|team,id| 
#     east_teams_ranked.each{|api_id,rank| 
#         if id == api_id
#             east_hash[team] = rank.to_i
#         end
# }}
# final_east_hash = east_hash.sort_by {|_key, value| value}.to_h

# west_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/west")
# west_teams = west_standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
# west_teams_ranked = {}
# west_teams.each{|team|west_teams_ranked[team["teamId"]] = team["conference"]["rank"]} #api_teamId = rank

# west_hash = {}
# teams_with_api_id_hash.each {|team,id| 
#     west_teams_ranked.each{|api_id,rank| 
#         if id == api_id
#             west_hash[team] = rank.to_i
#         end
# }}
# final_west_hash = west_hash.sort_by {|_key, value| value}.to_h



welcome




#### WELCOME PROMPT
### ASKS If you need to sign up or login
    #### LOGIN PATH
    ### Match username to db if login
    ### USER MENU
    ### 1.) Favorite Teams
    ### 2.) Add a Favorite Team
    ### 3.) Edit Favorite Team
    ### 4.) Team Standings
    ### 5.) Schedule
        ### 1.) Last 5
        ### 2.) Next 5
        ### 3.) Add next 5 to my Google Calendar
    ### 6.) Stats
        ### 1.) Team Leaders
        ### 2.) Fun stats
    ### 7.) Delete a Favorite Team


    #### SIGN UP PATH
    ### Create new user if sign up
    ### ASK For Favorite NBA TEAM
        ### Provide list of teams to choose from
    ### Creates a new userteam with favorite nba team
    ### Shows USER MENU
