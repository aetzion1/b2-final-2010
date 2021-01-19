class Team < ApplicationRecord
    has_many :players
    has_many :competition_teams
    has_many :competitions, through: :competition_teams

    validates :hometown, presence: true
    validates :nickname, presence: true

    scope :sort_by_avg_age, lambda {select('teams.*, average(age) AS avg_age').order('avg_age')}

    def average_age
        players.average(:age)
    end

end
