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
        ##get standings method
    when 4
        ##get schedule menu
            ### 1.) Last 5
            ### 2.) Next 5
            ### 3.) Add next 5 to my Google Calendar
    when 5
        ##get stats menu
            ### 1.) Team Leaders
            ### 2.) Fun stats
    when 6
        ##delete_a_team_method
    when 7
        ##exit the program
    end
    
    
end

def display_all_teams
    Team.all.map{|team| puts "#{team.id}. #{team.name}" }
end


def get_standings

end

def display_schedule_options

end

def add_to_google_calendar

end

def display_stats_options

end







