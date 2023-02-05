class Member < ApplicationRecord
  belongs_to :team

  def self.injured_sort
    where(injured: true)
  end
end

