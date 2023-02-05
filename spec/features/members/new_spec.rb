require 'rails_helper'


describe '#create' do
  it 'can create a new team' do
    visit '/members/new'

    fill_in('Name', with: "Ricky Bobby")
    fill_in('Wage', with: 15.00)
    find('#injured').click
    click_button("Create Member")

    new_team_id = Member.last.id
    expect(current_path).to eq('/teams')
    expect(page).to have_content('Ricky Bobby')
  end
end