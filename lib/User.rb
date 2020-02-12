class User < ActiveRecord::Base
    has_many :user_teams
    has_many :teams, through: :user_teams

    @@prompt = TTY::Prompt.new

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
        team_id = @@prompt.select("Remove a team from your favorites:") do |menu|
            self.teams.each do |team|
                menu.choice team.name, team.id
            end
        end
        ut = UserTeam.find_by(user_id: self.id, team_id: team_id)
        ut.destroy
    end
end