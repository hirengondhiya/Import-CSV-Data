class Weapon < ApplicationRecord
  has_many :person_weapons
  has_many :people, through: :person_weapons
end
