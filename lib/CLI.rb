class CommandLineInterface
    attr_accessor :logged_in

    def initialize 
        @@prompt = TTY::Prompt.new
        @@nba = NbaApiCommunicator.new
    end


    ### WELCOME METHOD ###

    def welcome
        choice = @@prompt.select("Welcome to My NBA Calendar.") do |menu| 
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
        username = @@prompt.ask('Enter username:') do |q|
            q.required true
            q.modify :trim
        end

        user = User.find_by(user_name: username)

        if user
                @logged_in = true
                while @logged_in
                    display_user_menu(user)
                end
        else
            puts "Login Unsuccessful. No user found."
        end
    end

    def sign_up_path
        user_hash = @@prompt.collect do
            key(:user_name).ask('Enter a username:', required: true)
            key(:full_name).ask('Enter your full name:')
            key(:location).ask('Enter your city:')
        end
        user = User.create(user_hash)

        @logged_in = true
        while @logged_in
            display_user_menu(user)
        end
    end


    ### DISPLAY MENU & METHODS

    def display_user_menu(user)
        choice = @@prompt.select("Select an option:") do |menu|
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
            user.reload.display_teams
        when 2
            display_all_teams
            user.add_a_favorite_team
        when 3
            conference_standings_by_rank("east")
            conference_standings_by_rank("west")
        when 4
            team = user.select_a_team
            choice = @@prompt.select("Select an option:") do |menu|
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
                user.schedule_events_in_my_gcal(team)
            end

        when 5
            team = user.select_a_team
            choice = @@prompt.select("Select an option:") do |menu|
                menu.choice '1.Team Leaders', "a"
                menu.choice '2.Player Stats', "b"
            end

            case choice
            when "a"
                team.leaders
                puts "TEAM LEADERS BY THE LAST 10 GAMES"
            when "b"
                player = team.select_a_player
                player.fun_stats
            end

        when 6
            user.delete_team
        when 7
            #exit the program
            puts "See ya next time!"
            @logged_in = false
        end
    
    end



    ### DISPLAY NBA STUFF METHODS ###

    def display_all_teams
        Team.all.map{|team| puts "#{team.id}. #{team.name}" }
    end

    def conference_standings_by_rank(conf_division)
        standings_hash = @@nba.make_api_request_get_json("/standings/standard/2019/conference/#{conf_division}")
        teams = standings_hash["api"]["standings"].select{|t|t["league"] == "standard"}
        sorted_teams = teams.sort_by {|k| k["conference"]['rank'].to_i} 
        puts "#{conf_division.upcase} STANDINGS =>"
        sorted_teams.map do |team|
            puts "#{team['conference']['rank']}.#{get_team_name_by_id(team['teamId'])}  W: #{team['win']} L: #{team['loss'] }"
        end
        puts "\n\n"
    end

    ### HELPER METHODS ###

    def get_team_name_by_id(api_id)
        Team.all.find{|team| team.api_id == api_id.to_i}.name
    end

end





