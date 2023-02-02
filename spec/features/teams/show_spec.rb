require 'rails_helper'

describe 'team specifc page' do
  let!(:team_1) {Team.create!(name: "Bruins", games_won: 10, won_championship: true)}
  # let!(:team_2) {Team.create!(name: "Devils", games_won: 7, won_championship: false)}


  describe 'when I visit a specific team page' do
    it 'shows the attributes of the team' do
      visit "/teams/#{team_1.id}"
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.games_won)
      expect(page).to have_content(team_1.won_championship)
      # expect(page).to have_content(team_2.name)
    end
  end
end