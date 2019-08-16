class Role < ApplicationRecord
  def linky_name
    name.gsub(' ', '_')
  end

  def image
    "tokens/#{linky_name}_Token.png"
  end

  def wiki_link
    if linky_name == 'Devils_Advocate'
      return "http://bloodontheclocktower.com/wiki/Devil's_Advocate"
    end
    "http://bloodontheclocktower.com/wiki/#{self.linky_name}"
  end
end
