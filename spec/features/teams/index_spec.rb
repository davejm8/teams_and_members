require 'rails_helper'

RSpec.describe 'team index page' do
  let!(:team_1) {Team.create!(name: "Bruins", games_won: 10, won_championship: true)}
  let!(:team_2) {Team.create!(name: "Devils", games_won: 7, won_championship: false)}

  before do
    visit '/teams'
  end

  describe 'when I visit team index page' do
    it 'shows the attributes of each team' do
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_2.name)
    end
  end

  describe 'when I visit team index page' do
    it "shows when the records were created" do
      expect(team_2.name).to appear_before(team_1.name)
    end

    it 'displays the created_at for each team' do
      team_1 = Team.create!(name: "Smash Bros", games_won: 10, won_championship: true)
      sleep(1)
      team_2 = Team.create!(name: "Hooligans", games_won: 7, won_championship: false)
      visit "/teams"
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.created_at)
  
      expect(team_2.name).to appear_before(team_2.created_at.to_s)
      expect(team_2.created_at.to_s).to appear_before(team_1.name)
      expect(team_1.name).to appear_before(team_1.created_at.to_s)
    end

    it 'has a link on the team page that takes me to a page to create a new team' do
      expect(page).to have_link 'Add New Team', href: "/teams/new"
    end

    it 'has a link on the team page that takes me to a page to create a new team' do
      expect(page).to have_link 'Add New Team', href: "/teams/new"
    end

    it 'has a link to team update page for specific team' do
      expect(page).to have_link "Update #{team_1.name}", href: "/teams/#{team_1.id}/edit"
      click_link "Update #{team_1.name}"
    
      expect(page).to have_content("Name")
      expect(current_path).to eq("/teams/#{team_1.id}/edit")
    end
  end
end