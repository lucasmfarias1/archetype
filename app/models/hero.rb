class Hero < ApplicationRecord
  belongs_to :user
  has_one :hero_gear,
          class_name: :HeroGear,
          foreign_key: :hero_id,
          dependent: :destroy

  validates :name, presence: true, length: { in: 1..20 }
  validates :archetype, inclusion: { in: %w[dps tank healer] }
  validates :damage, inclusion: { in: %w[physical magical] }
  validates :range, inclusion: { in: %w[melee ranged] }
  validates :race, inclusion: { in: %w[human elf orc] }
  validates :gender, inclusion: { in: %w[male female] }

  def gear_id
    if hero_gear
      hero_gear.gear.id
    else
      0
    end
  end
end
