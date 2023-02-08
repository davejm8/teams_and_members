require 'rails_helper'

RSpec.describe 'team edit' do
  it 'links to the edit team page' do
    @team = Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)
    visit "/teams/#{@team.id}"
    click_button "Update #{@team.name}"

    expect(current_path).to eq("/teams/#{@team.id}/edit")
  end

  it 'can edit a team' do
    @team = Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)
    visit "/teams/#{@team.id}"
    click_button "Update #{@team.name}"

    fill_in "Name", with: 'Testteam'
    click_button "Update Team"

    expect(current_path).to eq("/teams/#{@team.id}")
    expect(page).to have_content("Testteam")
  end 
end