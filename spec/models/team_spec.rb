require 'rails_helper'

describe Team do
  describe 'relations' do
    it { should have_many :members }
  end
end