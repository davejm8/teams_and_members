require 'rails_helper'

describe Member do
  describe 'relations' do
    it { should belong_to :team }
  end
end