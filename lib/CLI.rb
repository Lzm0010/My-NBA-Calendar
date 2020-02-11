


def display_user_menu
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. Add a Favorite Team\n3. Edit Favorite Team\n4. Team Standings\n5. Schedule\n6. Stats\n7. Delete a Favorite Team\n8. Exit"
    ### 5.1.) Last 5
    ### 2.) Next 5
    ### 3.) Add next 5 to my Google Calendar
    ### 6.1.) Team Leaders
    ### 2.) Fun stats
end

def display_teams
    nba = NbaApiCommunicator.new
    teams_hash = nba.make_api_request_get_json("/teams/league/standard")
    nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}.map{|nba_team| nba_team["fullName"]}
    ap nba_teams
end


def get_user_input
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. Add a Favorite Team\n3. Edit Favorite Team\n4. Team Standings\n5. Schedule\n6. Stats\n7. Delete a Favorite Team\n8. Exit"
    input = gets.chomp
end

def run
    input = nil
    while input != "8"
        input = get_user_input
        if input = "1"
            print_all_teams 

        elsif input = "2"

        elsif input = "3"

        elsif input = "4"

        elsif input = "5"

        elsif input = "6"

        elsif input = "7"


        end


    end

end
def display_schedule_options


end

def add_to_google_calendar

end

def display_stats_options

end








