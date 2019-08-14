class Game < ApplicationRecord
  has_many :players
  validates :name, uniqueness: true
end
