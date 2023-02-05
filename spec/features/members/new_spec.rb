require 'rails_helper'


RSpec.describe '#create' do
let!(:team) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  it 'can create a new member' do
    visit "/teams/#{team.id}/members/new"

    fill_in('Name', with: "Ricky Bobby")
    fill_in('Wage', with: 15.00)
    find('#injured').click
    click_button("Create Member")

    new_member_id = Member.last.id
    expect(current_path).to eq("/teams/#{team.id}/members")
    expect(page).to have_content('Ricky Bobby')
  end
end