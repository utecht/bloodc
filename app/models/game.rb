class Game < ApplicationRecord
  has_many :players
  validates :name, uniqueness: true
  def full_edition
    if edition == 'sects'
      return "Sects & Violets"
    elsif edition == 'trouble'
      return "Trouble Brewing"
    elsif edition == 'moon'
      return "Bad Moon Rising"
    end
    edition
  end
end
