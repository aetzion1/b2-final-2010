class Competition < ApplicationRecord
    has_many :teams, through: :competition_teams
end
