class Person < ApplicationRecord
  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :locations

  has_one :vehicle_person
  has_one :vehicle, through: :vehicle_person

  has_one :person_weapon
  has_one :weapon, through: :person_weapon
end
