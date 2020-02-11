class User < ActiveRecord::Base
    has_many :userteams
    has_many :teams through: :userteams
end