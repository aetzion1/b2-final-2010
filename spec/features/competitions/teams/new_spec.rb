require 'rails_helper'

RSpec.describe "team new page" do

    before :each do 
        @competition1 = Competition.create!(name: "Feats of Strength", location: "Isle of Sky", sport: "Hurling")
        @team1 = Team.create!(hometown: "Saskatoon", nickname: "Sycophants", competition: @competition1)
        @team2 = Team.create!(hometown: "Manhattan", nickname: "Hurling Club", competition: @competition1)
        @player1 = Player.create!(name: "Manny MantaRay Lewis", age: 30, team: @team1)
        @player2 = Player.create!(name: "Martha Stew Wort", age: 20, team: @team1)
        @player3 = Player.create!(name: "Tommy Pickles", age: 40, team: @team2)
        @player4 = Player.create!(name: "Stu Pickles", age: 10, team: @team2)
        CompetitionTeam.create!(competition: @competiton1, team: @team1)
        CompetitionTeam.create!(competition: @competiton1, team: @team2)
    
        visit competition_path(@competition1.id)
      end
    

  describe "As a user" do
    it "I can create a new team via the form" do
        
    end 
end

end