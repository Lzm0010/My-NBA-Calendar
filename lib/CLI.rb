require_relative '../config/environment.rb'
require_relative './NbaApi.rb'
require_relative './User.rb'
require_relative './UserTeam.rb'




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
    puts "Welcome to My NBA Calendar!"
    puts "Please enter your usename"
    login = gets.chomp
end

def match_user_id
    if User.all.find{|u|u.user_name == login}
        "Login successful"
    end 
    "Username does not exist"
end

def display_favorite_teams
    userteam = UserTeam.all.find{|ut|ut.user_id == @user.id}
    team_id = userteam.team_id 
    team = Team.all.find{|t|t.id == team_id}
    team
end


def get_user_input
    input = gets.chomp
end

def default_menu
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. View All Teams\n3. Team Standings\n4. Schedule\n5. Stats\n6. Exit"
end

def favorite_teams_menu
    puts "Please choose one of the following:"
    puts "1. Add a Favorite Team\n2. Edit Favorite Teams\n3. Delete a Favorite Team\n4. Previous Menu"
end

def run
    login = nil
    get_user_login
    while match_user_id
        input = nil
        while input != "6"
            default_menu
            input = get_user_input
                if input == "1" ## SHOW CURRENT FAVORITE TEAM(S)
                    display_favorite_teams
                    puts "What would you like to do?"
                        favorite_teams_menu
                        input = nil
                        while input != "4"
                            input = get_user_input
                                if input == "1" ## ADD A FAVORITE TEAM

                                elsif input == "2" ## EDIT FAVORITE TEAMS

                                elsif input == "3" ## DELETE FAVORITE TEAM

                                end 
                        end

                elsif input == "2" ## VIEW ALL TEAMS 
                    display_teams
                elsif input == "3"

                elsif input == "4"

                elsif input == "5"

                end
        end  
    end
end
<<<<<<< HEAD

def display_schedule_options
=======
>>>>>>> d742de2556b955283f572fca831e2996304c2979

def display_schedule_options

end

def add_to_google_calendar

end

def display_stats_options

end


run




