require_relative '../config/environment'

# nba = NbaApiCommunicator.new
# east_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/east")
# east_teams = east_standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
# east_teams.each do |team|puts "Team ID: #{team["teamId"]} Rank: #{team["conference"]["rank"]}" east_standings_hash
# west_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/west")
# west_standings = standings

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
