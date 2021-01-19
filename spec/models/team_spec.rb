require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should have_many :players }
    it { should have_many :competition_teams }
    it { should have_many :competitions }
  end

  describe "instance methods" do
    it "average_age" do
      @team1 = Team.create!(hometown: "Saskatoon", nickname: "Sycophants")
      @team2 = Team.create!(hometown: "Manhattan", nickname: "Hurling Club")
      @player1 = Player.create!(name: "Manny MantaRay Lewis", age: 30, team: @team1)
      @player2 = Player.create!(name: "Martha Stew Wort", age: 20, team: @team1)
      @player3 = Player.create!(name: "Tommy Pickles", age: 40, team: @team2)
      @player4 = Player.create!(name: "Stu Pickles", age: 10, team: @team2)
    
      expect(@team1.average_age).to eq(25)
    end
  end
end
