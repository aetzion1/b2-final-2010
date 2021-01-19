require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "relationships" do
    it { should have_many :competition_teams }
    it { should have_many :teams }
    it { should have_many :players }
  end
end
