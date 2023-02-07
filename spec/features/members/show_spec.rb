require 'rails_helper'

describe 'member specifc page' do
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}


  describe 'when I visit a specific member page' do
    it 'shows the attributes of the member' do
      visit "/members/#{mario.id}"

      expect(page).to have_content(mario.wage)
      expect(page).to have_content(mario.injured)
      expect(page).to have_content(mario.team.name)
    end

    it 'has a link on to its team page' do
      
      visit "/members/#{mario.id}"
      expect(page).to have_link "#{smash.name}", href: "/teams/#{smash.id}"
    end
  
    it 'has a button to delete the specific team with all members' do
      visit "/members/#{mario.id}"
      click_button "Delete #{mario.name}"
      save_and_open_page

      expect(page).to_not have_content("#{mario.name}")
      expect(current_path).to eq("/members")

      visit '/members'
      expect(page).to_not have_content("#{mario.name}")
    end
  end
end