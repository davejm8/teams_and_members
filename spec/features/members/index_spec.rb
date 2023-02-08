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
    
    it 'has a link to the members index' do
      expect(page).to have_link 'Members Index', href: "/members"
  
      visit "/members/#{mario.id}"
      expect(page).to have_link 'Members Index', href: "/members"
    end

    it 'has a link to the team index' do
      expect(page).to have_link 'Teams Index', href: "/teams"
  
      visit "/members/#{mario.id}"
      expect(page).to have_link 'Teams Index', href: "/teams"
    end
  
    it 'has a link to only display members who are injured' do
      expect(page).to have_link "Injured Members"
      click_link "Injured Members"
    
      expect(page).to have_content(luigi.name)
      expect(page).to have_content(luigi.wage)
      expect(page).to have_content(luigi.injured)
    end
    
    it 'has a link to member update page' do
      expect(page).to have_link "Update #{mario.name}", href: "/members/#{mario.id}/edit"
      click_link "Update #{mario.name}"

      expect(page).to have_content("Name")
      expect(current_path).to eq("/members/#{mario.id}/edit")
    end
  end
end