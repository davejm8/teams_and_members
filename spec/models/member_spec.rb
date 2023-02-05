require 'rails_helper'

describe Member do
  describe 'relations' do
    it { should belong_to :team }
  end
  
  let!(:smash) {Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)}
  let!(:mario) {smash.members.create!(name: "Mario", wage: 95.05, injured: false, team_id: smash.id)}
  let!(:luigi) {smash.members.create!(name: "Luigi", wage: 90.00, injured: true, team_id: smash.id)}

  it 'has a class method to pull out injured members' do

    expect(Member.injured_sort).to eq([luigi])
  end
end