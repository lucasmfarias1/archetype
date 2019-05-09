class Hero < ApplicationRecord
  has_one :hero_gear, class_name: :HeroGear, foreign_key: :hero_id

  def gear_id
    if hero_gear
      hero_gear.gear.id
    else
      0
    end
  end
end
