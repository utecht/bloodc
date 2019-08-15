class Role < ApplicationRecord
  def image
    "tokens/#{name.gsub(' ', '_')}_Token.png"
  end
end
