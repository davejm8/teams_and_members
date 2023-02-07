require 'rails_helper'

RSpec.describe 'team specifc page' do
  let!(:team_1) {Team.create!(name: "Bruins", games_won: 10, won_championship: true)}
  let!(:mario) {team_1.members.create!(name: "Mario", wage: 95.05, injured: false, team_id: team_1.id)}
  let!(:luigi) {team_1.members.create!(name: "Luigi", wage: 90.00, injured: true, team_id: team_1.id)}

  describe 'when I visit a specific team page' do
    it 'shows the attributes of the team' do
      visit "/teams/#{team_1.id}"

      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.games_won)
      expect(page).to have_content(team_1.won_championship)
    end

    
    it 'displays the number of members associated with a team on the show page' do
      visit "/teams/#{team_1.id}"

      expect(page).to have_content("Team Members: 2")
    end

    it 'has a link to the members index at the top of every page' do
      visit "/teams"

      expect(page).to have_link 'Members Index', href: "/members"

      visit "/teams/#{team_1.id}"

      expect(page).to have_link 'Members Index', href: "/members"
    end

    it 'has a link to the team index' do
      visit "/teams"
      expect(page).to have_link 'Teams Index', href: "/teams"

      visit "/teams/#{team_1.id}"
      expect(page).to have_link 'Teams Index', href: "/teams"
    end

    it 'has a link on the team page to the that teams members' do
      
      visit "/teams/#{team_1.id}"
      expect(page).to have_link 'Team Members', href: "/teams/#{team_1.id}/members"
    end
  
    it 'has a link to delete the specific team with all members' do
      visit "/teams/#{team_1.id}"
      click_button "Delete #{team_1.name}"

      expect(page).to_not have_content("#{team_1.name}")
      expect(current_path).to eq("/teams")

      visit '/members'
      expect(page).to_not have_content("#{mario.name}")
      expect(page).to_not have_content("#{luigi.name}")
    end
  end
end