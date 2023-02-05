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

  it 'has a link to only display players who are eligible for trade' do
    visit "/members"
    expect(page).to have_link "Injured Members"
    click_link "Injured Members"
  
    expect(page).to have_content("Injured Members:")
    expect(page).to have_content(mario.name)
    expect(page).to have_content("Team ID: #{smash.id}")
    expect(page).to have_content("Wage: $#{mario.wage}")
    expect(page).to have_content("Injured? #{mario.injured}")
  end
end