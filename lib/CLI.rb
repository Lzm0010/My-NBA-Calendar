require_relative '../config/environment.rb'

### WELCOME METHOD ###

def welcome
    puts "Welcome to My NBA Calendar."
    puts "1. Login\n2. Sign up"
    input = gets.chomp
    if input == "1"
        login_path
    elsif input == "2"
        sign_up_path
    else
        try_again_path
    end
end

### USER PATH METHODS ###

def login_path
    puts "Enter username: "
    username = gets.chomp
    user = User.find_by(user_name: username)
    if user
        display_user_menu(user)
    else
        try_again_path
    end
end

def sign_up_path
    puts "Enter a username:"
    user_name = gets.chomp
    puts "Enter your full name:"
    full_name = gets.chomp
    puts "Enter your city:"
    city = gets.chomp
    user = User.create(user_name:user_name, 
                full_name:full_name, 
                location:city)
    display_user_menu(user)
end

def try_again_path
    puts "Not a valid input, please try again."
    welcome
end


### DISPLAY INFO 

def display_user_menu(user)
    puts "Please choose one of the following:"
    puts "1. Favorite Teams\n2. Add a Favorite Team\n3. Team Standings\n4. Schedule\n5. Stats\n6. Delete a Favorite Team\n7. Exit"
    choice = gets.chomp
    case choice
    when "1"
        display_teams(user)
    when "2"
        display_teams
        create_user_team_from_input
    when "3"
        ##what i worked on
        
    else
        
    end
    ### 5.1.) Last 5
    ### 2.) Next 5
    ### 3.) Add next 5 to my Google Calendar
    ### 6.1.) Team Leaders
    ### 2.) Fun stats
end

def display_teams(user=nil)
    if user
        user.teams.each{|team| puts "#{team.name}"}
    else
        Team.all.map{|team| puts "#{team.id}. #{team.name}" }
    end
end

def create_user_team_from_input
    puts "Pick a team by ID to add to your favorites:"
    team_id = gets.chomp
    UserTeam.create(user_id: user.id, team_id: team_id)
end

def get_standings

end

def display_schedule_options

end

def add_to_google_calendar

end

def display_stats_options

end







