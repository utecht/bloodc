class Player < ApplicationRecord
  belongs_to :role
  belongs_to :game
end
