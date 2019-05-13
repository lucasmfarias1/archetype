class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :gender
      t.string :archetype
      t.string :range
      t.string :damage
      t.string :race

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
