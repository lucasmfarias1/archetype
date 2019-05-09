class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string :name
      t.integer :armor

      t.timestamps
    end
  end
end
