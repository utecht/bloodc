class Player < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :game

  def dead
    false
  end
end
