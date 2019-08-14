class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :willing_demon
      t.references :role, null: true, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
