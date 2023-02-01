require 'rails_helper'

describe 'team index page' do
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}
  let!(:luigi) {Member.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)}

  before do
    visit '/members'
  end

  describe 'when I visit member index page' do
    it 'shows the name of each member' do
      expect(page).to have_content(mario.name)
      expect(page).to have_content(luigi.name)
    end
  end
end