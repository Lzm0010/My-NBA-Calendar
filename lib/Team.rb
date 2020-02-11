class Team < ActiveRecord::Base
    has_many :userteams
    has_many :users, through: :userteams
end