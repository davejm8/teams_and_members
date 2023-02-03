require 'rails_helper'

describe Team do
  describe 'relations' do
    it { should have_many :members }
  end

  describe 'instance methods' do
    before :each do
      @smash = Team.create!(name: "Super Smash Bros", games_won: 12, won_championship: true)
      @mario = Member.create!(name: "Mario", wage: 95.05, injured: false, team_id: @smash.id)
      @luigi =  Member.create!(name: "Luigi", wage: 90.00, injured: true, team_id: @smash.id)
    end

    describe '#member_count' do
      it 'counts the number of members on a team' do
        expect(@smash.member_count).to eq(2)
      end
    end
  end
end