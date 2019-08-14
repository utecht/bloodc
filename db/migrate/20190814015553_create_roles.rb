class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.string :edition
      t.string :faction
      t.boolean :first_day
      t.boolean :night

      t.timestamps
    end
  end
end
