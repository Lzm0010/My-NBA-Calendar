class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    @@my_cal = GoogleCalendar.new
    @@prompt = TTY::Prompt.new

    def select_a_team
        team_id = self.get_team_id("Select a team:")
        Team.find(team_id)
    end

    def display_teams
        self.teams.each{|team| puts "#{team.name}"}
    end
    
    def add_a_favorite_team
        team_id = @@prompt.ask("Pick a team by ID to add to your favorites:") do |q|
            q.in '1-30'
            q.messages[:range?] = "%{value} out of expected range #{q.in}"
        end
        UserTeam.create(user_id: self.id, team_id: team_id)
    end

    def delete_team
        team_id = get_team_id("Remove a team from your favorites:")
        ut = UserTeam.find_by(user_id: self.id, team_id: team_id)
        ut.destroy
    end

    def schedule_events_in_my_gcal(team)
        games = team.next_five
        games.each do |game|
        # "#{game["vTeam"]["fullName"]} @ #{game["hTeam"]["fullName"]} #{game['startTimeUTC'].to_datetime.localtime("-05:00").strftime("%m/%d/%Y %I:%M %p")}"
            event = Google::Apis::CalendarV3::Event.new(
                summary: "#{game["vTeam"]["fullName"]} @ #{game["hTeam"]["fullName"]}",
                location: 'My couch in front of the TV.',
                start: Google::Apis::CalendarV3::EventDateTime.new(
                date_time: "#{game['startTimeUTC']}",
                time_zone: 'America/New_York'
                ),
                end: Google::Apis::CalendarV3::EventDateTime.new(
                date_time: "#{game['startTimeUTC'].to_datetime + (3/24.0)}",
                time_zone: 'America/New_York'
                ),
                reminders: Google::Apis::CalendarV3::Event::Reminders.new(
                use_default: false,
                overrides: [
                    Google::Apis::CalendarV3::EventReminder.new(
                    reminder_method: 'email',
                    minutes: 24 * 60
                    ),
                    Google::Apis::CalendarV3::EventReminder.new(
                    reminder_method: 'popup',
                    minutes: 10
                    )
                ]
                )
            )
          
            result = @@my_cal.insert_event(event)
            puts "Event created: #{result.html_link}"
        end
    end

    ### HELPER METHODS ###

    def get_team_id(prompt)
        team_id = @@prompt.select(prompt) do |menu|
            self.teams.each do |team|
                menu.choice team.name, team.id
            end
        end
        team_id
    end
end