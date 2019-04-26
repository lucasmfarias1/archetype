class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :job
      t.integer :power
      t.integer :speed
      t.integer :vitality
      t.integer :max_hp

      t.timestamps
    end
  end
end
