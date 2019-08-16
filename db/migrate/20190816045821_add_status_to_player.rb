class AddStatusToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :drunk, :boolean
    add_column :players, :dead, :boolean
    add_column :players, :poisoned, :boolean
    add_column :players, :misc1, :boolean
    add_column :players, :misc2, :boolean
    add_column :players, :notes, :text
  end
end
