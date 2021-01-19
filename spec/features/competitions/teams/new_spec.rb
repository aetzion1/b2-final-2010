require 'rails_helper'

RSpec.describe "team new page" do

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
    end 
    
    describe "As a user" do
        it "I can create a new team" do
            visit competition_path(@competition1) 

            click_link 'Register New Team'

            expect(current_path).to eq(new_competition_team_path(@competition1))

            fill_in 'Hometown', with: 'Missoula'
            fill_in 'Nickname', with: 'Munchies'
            click_on 'Register Team'

            expect(current_path).to eq(competition_path(@competition1))
            expect(page).to have_content('Missoula Munchies')
        end
    end

    describe "Click Register Team without filling in a nickname" do
        xit "Then I see a message telling me that I am missing required information And I still see the new team form" do
            visit new_competition_team_path(@competition1) 
            
            click_on 'Register Team'
            
            expect(page).to have_content('Team not registered: Missing required information')
            expect(page).to have_button('Register Team')
        end
    end

end