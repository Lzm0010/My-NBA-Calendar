require_relative '../config/environment'
require_relative './NbaApi.rb'


def display_user_menu
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. Add a Favorite Team\n3. Edit Favorite Team\n4. Team Standings\n5. Schedule\n6. Stats\n7. Delete a Favorite Team\n8. Exit"
    ### 5.1.) Last 5
    ### 2.) Next 5
    ### 3.) Add next 5 to my Google Calendar
    ### 6.1.) Team Leaders
    ### 2.) Fun stats
    display_teams
end

def display_teams
    nba = NbaApiCommunicator.new
    teams_hash = nba.make_api_request_get_json("/teams/league/standard")
    nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}.map{|nba_team| nba_team["fullName"]}
    nba_teams
end

def get_user_login
    puts "Please enter your usename"
    login = gets.chomp
end

def match_user_id(login)
    if User.all.find{|u|u.user_name == login}
        "Login successful"
    end 
    user_id = user.id 
end

def display_favorite_teams
    UserTeam.all.find{|ut|ut.user_id == @user.id}
end


def get_user_input
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. Add a Favorite Team\n3. Edit Favorite Team\n4. Team Standings\n5. Schedule\n6. Stats\n7. Delete a Favorite Team\n8. Exit"
    input = gets.chomp
end

def run
    get_user_login
        while User.all.find{|u|u.user_name == login}
            puts "Login successful"
            input = nil
            while input != "8"
                input = get_user_input
                if input == "1"
                    #show current favorite team
                    #give option to 
                        #1) add
                        #2) edit
                        #3) delete
                elsif input == "2"
                    display_teams
                elsif input == "3"

                elsif input == "4"

                elsif input == "5"

                elsif input == "6"

                elsif input == "7"


                end


            end
        end

end
def display_schedule_options

def display_schedule_options

end

def add_to_google_calendar

end

def display_stats_options

end







