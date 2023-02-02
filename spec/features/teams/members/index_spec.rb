require 'rails_helper'

RSpec.describe 'Teams members index' do
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {smash.members.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}
  let!(:luigi) {smash.members.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)}

  it 'shows all the player names on a team' do
    visit "/teams/#{smash.id}/members"
    expect(page).to have_content(mario.name)
    expect(page).to have_content(luigi.name)
  end

  it 'links to each member page' do

  end
end