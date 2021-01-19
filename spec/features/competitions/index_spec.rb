require 'rails_helper'

RSpec.describe "competitions index page" do

    before :each do 
        @competition1 = Competition.create!(name: "Feats of Strength", location: "Isle of Sky", sport: "Hurling")
        @competition2 = Competition.create!(name: "The Ruby on Rails Bowl", location: "Honolulu", sport: "Futbol")
    end

  describe "As a user" do
    it "displays the names of all competitions" do
        visit competitions_path

        expect(page).to have_content(@competition1.name)
        expect(page).to have_content(@competition2.name)
    end

    it  "includes a link to each competition's show page within the names" do
        visit competitions_path

        expect(page).to have_link(@competition1.name)
        expect(page).to have_link(@competition2.name)

        click_link @competition1.name

        expect(current_path).to eq(competition_path(@competition1.id))
    end

  end

end
