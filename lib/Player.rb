require 'date'

class Player < ActiveRecord::Base
    belongs_to :team

    @@nba = NbaApiCommunicator.new

    def fun_stats
        puts "NAME: #{self.name}"
        puts "TEAM: #{self.team.name}"
        puts "POSITION: #{self.position}"
        puts "JERSEY #: #{self.number}"
        puts "AGE: #{self.age_in_years.to_s}"
        puts "WEIGHT: #{self.weight} lbs"
        puts "HEIGHT: #{self.height_in_feet_and_inches}"
        puts "TIME IN NBA: #{self.time_in_nba.to_s} years"
        puts "LEGENDS NEVER DIE #MAMBA MENTALITY"
    end

    def age_in_years
        dob = self.age.to_date
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def height_in_feet_and_inches
        height_in_meters = self.height.to_f
        total_inches = height_in_meters * 39.37
        feet = (total_inches/12).to_i 
        remainder = ((total_inches.to_f) - (feet * 12)).to_i
        "#{feet} ft #{remainder} inches"
    end

    def time_in_nba
        now = Time.now.utc.to_date
        now.year.to_i - self.start_nba
    end

end