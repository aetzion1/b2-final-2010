require 'rails_helper'

RSpec.describe "competition show page" do

  before :each do 
    @competition1 = Competition.create!(name: "Feats of Strength", location: "Isle of Sky", sport: "Hurling")
    @team1 = Team.create!(hometown: "Saskatoon", nickname: "Sycophants")
    @team2 = Team.create!(hometown: "Manhattan", nickname: "Hurling Club")
    @player1 = Player.create!(name: "Manny MantaRay Lewis", age: 30, team: @team1)
    @player2 = Player.create!(name: "Martha Stew Wort", age: 20, team: @team1)
    @player3 = Player.create!(name: "Tommy Pickles", age: 40, team: @team2)
    @player4 = Player.create!(name: "Stu Pickles", age: 10, team: @team2)
    CompetitionTeam.create!(competition: @competition1, team: @team1)
    CompetitionTeam.create!(competition: @competition1, team: @team2)

    visit competition_path(@competition1.id)
  end

  describe "As a user" do

    it "displays the competition name, location and sport" do
      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
    end

    it "displays the name and hometown of all teams in the competition" do
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to have_content(@team2.nickname)
    end

    it "displays the average age of all players in the competition" do
      expect(page).to have_content("Average Player Age: 25")
    end

    it "displays a link to register a new team" do
      expect(page).to have_link('Register New Team')

      click_link('Register New Team')

      expect(current_path).to eq(new_competition_team_path(@competition1))
    end
  end

end
