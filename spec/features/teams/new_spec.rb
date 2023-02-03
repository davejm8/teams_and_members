require 'rails_helper'


describe '#create' do
  it 'can create a new team' do
    visit '/teams/new'

    fill_in('Name', with: "Molly Woppers")
    fill_in('Wins', with: 3)
    find('#won_championship').click
    click_button("Create Team")

    new_team_id = Team.last.id
    expect(current_path).to eq('/teams')
    expect(page).to have_content('Molly Woppers')
  end
end