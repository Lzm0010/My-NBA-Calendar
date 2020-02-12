class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

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