require 'rails_helper'

RSpec.describe 'team index page' do
  let!(:team_1) {Team.create!(name: "Bruins", games_won: 10, won_championship: true)}
  let!(:team_2) {Team.create!(name: "Devils", games_won: 7, won_championship: false)}

  before do
    visit '/teams'
  end

  describe 'when I visit team index page' do
    it 'shows the attributes of each team' do
      expect(page).to have_content(team_1.name)

      expect(page).to have_content(team_2.name)
    end
  end

  describe 'when I visit team index page' do
    it "shows when the records were created" do
      
      expect(team_2.name).to appear_before(team_1.name)
    end
  end
end