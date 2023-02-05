require 'rails_helper'

RSpec.describe 'member edit' do
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}
  let!(:luigi) {Member.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)}

  it 'links to the edit member page' do
    visit "/members/#{mario.id}"
    click_button "Update Member"

    expect(current_path).to eq("/members/#{mario.id}/edit")
  end

  it 'can edit a member' do
    visit "/members/#{mario.id}"
    click_button "Update Member"

    fill_in "Name", with: 'Testmember'
    click_button "Update Member"

    expect(current_path).to eq("/members/#{mario.id}")
    expect(page).to have_content("Testmember")
  end 
end