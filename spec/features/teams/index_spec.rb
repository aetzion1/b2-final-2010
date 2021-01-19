require 'rails_helper'

RSpec.describe "teams index page" do

    before :each do 
        @team1 = Team.create!(hometown: "Saskatoon", nickname: "Sycophants")
        @team2 = Team.create!(hometown: "Manhattan", nickname: "Hurling Club")
        @player1 = Player.create!(name: "Manny MantaRay Lewis", age: 30, team: @team1)
        @player2 = Player.create!(name: "Martha Stew Wort", age: 20, team: @team1)
        @player3 = Player.create!(name: "Tommy Pickles", age: 40, team: @team2)
        @player4 = Player.create!(name: "Stu Pickles", age: 10, team: @team2)
    
        visit teams_path
    end

    describe "As a user" do
        it "displays the names of all teams" do
            expect(page).to have_content(@team1.name)
            expect(page).to have_content(@team2.name)
        end

        it "includes the average age of each team's players" do
            expect(page).to have_content(@team1.average_age)
            expect(page).to have_content(@team2.average_age)
        end

        it "sorts teams by average age in descending order" do
        end
    end
end

