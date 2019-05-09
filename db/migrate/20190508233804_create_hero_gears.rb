class CreateHeroGears < ActiveRecord::Migration[5.2]
  def change
    create_table :hero_gears do |t|
      t.references :hero, foreign_key: true
      t.references :gear, foreign_key: true

      t.timestamps
    end
  end
end
