require_relative '../config/environment.rb'

### WELCOME METHOD ###

def welcome
    prompt = TTY::Prompt.new
    choice = prompt.select("Welcome to My NBA Calendar.") do |menu| 
        menu.choice '1.Login', 1
        menu.choice '2.Signup', 2
    end

    case choice
    when 1
        login_path
    when 2
        sign_up_path
    end
end

### USER PATH METHODS ###

def login_path
    prompt = TTY::Prompt.new
    username = prompt.ask('Enter username:') do |q|
        q.required true
        q.modify :trim
    end

    user = User.find_by(user_name: username)

    if user
        display_user_menu(user)
    else
        puts "Login Unsuccessful. No user found."
    end
end

def sign_up_path
    prompt = TTY::Prompt.new
    user_hash = prompt.collect do
        key(:user_name).ask('Enter a username:', required: true)
        key(:full_name).ask('Enter your full name:')
        key(:location).ask('Enter your city:')
    end
    user = User.create(user_hash)
    display_user_menu(user)
end


### DISPLAY MENU & METHODS

def display_user_menu(user)
    prompt = TTY::Prompt.new
    choice = prompt.select("Select an option:") do |menu|
        menu.choice '1.Favorite Teams', 1
        menu.choice '2.Add a Favorite Team', 2
        menu.choice '3.Team Standings', 3
        menu.choice '4.Schedule', 4
        menu.choice '5.Stats', 5
        menu.choice '6.Delete a Favorite Team', 6
        menu.choice '7.Exit', 7
    end
     
    case choice
    when 1
        user.display_teams
    when 2
        display_all_teams
        user.add_a_favorite_team
    when 3
        display_standings
    when 4
        # Team.select_team
        choice = prompt.select("Select an option:") do |menu|
            menu.choice '1.Last 5', "a"
            menu.choice '2.Next 5', "b"
            menu.choice '3.Add next 5 to my Google Calendar', "c"
        end

        case choice
        when "a"
            team.last_five
        when "b"
            team.next_five
        when "c"
            ### add google calendar method
        end

    when 5
        choice = prompt.select("Select an option:") do |menu|
            menu.choice '1.Team Leaders', 1
            menu.choice '2.Fun Stats', 2
        end
    when 6
        user.delete_team
    when 7
        #exit the program
        puts "See ya next time!"
    end
    
    
end

def display_standings
nba = NbaApiCommunicator.new

teams_hash = nba.make_api_request_get_json("/teams/league/standard")
nba_teams = teams_hash["api"]["teams"].select{|team| team["nbaFranchise"] == "1"}
teams_with_api_id_hash = {}
nba_teams.each{|team|teams_with_api_id_hash[team["fullName"]] = team["teamId"]}

east_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/east")
east_teams = east_standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
east_teams_ranked = {}
east_teams.each{|team|east_teams_ranked[team["teamId"]] = team["conference"]["rank"]} #api_teamId = rank

east_hash = {}
teams_with_api_id_hash.each {|team,id| 
    east_teams_ranked.each{|api_id,rank| 
        if id == api_id
            east_hash[team] = rank.to_i
        end
}}
final_east_hash = east_hash.sort_by {|_key, value| value}.to_h

west_standings_hash = nba.make_api_request_get_json("/standings/standard/2019/conference/west")
west_teams = west_standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
west_teams_ranked = {}
west_teams.each{|team|west_teams_ranked[team["teamId"]] = team["conference"]["rank"]} #api_teamId = rank

west_hash = {}
teams_with_api_id_hash.each {|team,id| 
    west_teams_ranked.each{|api_id,rank| 
        if id == api_id
            west_hash[team] = rank.to_i
        end
}}
final_west_hash = west_hash.sort_by {|_key, value| value}.to_h
puts "WEST STANDINGS"
ap final_west_hash
puts "EAST STANDINGS"
ap final_east_hash
end

def display_all_teams
    Team.all.map{|team| puts "#{team.id}. #{team.name}" }
end

def add_to_google_calendar

end








