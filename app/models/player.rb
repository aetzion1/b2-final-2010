class Player < ApplicationRecord
  belongs_to :team

  def self.average_age
    average(:age)
  end

  scope :sort_by_avg_age, lambda {select('players.*, average(age)').order('average_age desc')}
end
