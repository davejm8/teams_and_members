class Team < ApplicationRecord
  has_many :members

  def member_count
    self.members.count
  end
end
