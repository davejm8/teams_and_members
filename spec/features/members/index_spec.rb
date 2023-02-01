require 'rails_helper'

describe 'team index page' do
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}
  let!(:luigi) {Member.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)}

  before do
    visit '/members'
  end

  describe 'when I visit member index page' do
    it 'shows the attributes of each member' do
      expect(page).to have_content(mario.name)
      expect(page).to have_content(mario.wage)
      expect(page).to have_content(mario.injured)

      expect(page).to have_content(luigi.name)
      expect(page).to have_content(luigi.wage)
      expect(page).to have_content(luigi.injured)
    end
  end
end