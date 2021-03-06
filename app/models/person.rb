class Person < ApplicationRecord
  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :locations

  has_one :vehicle_person
  has_one :vehicle, through: :vehicle_person

  has_one :person_weapon
  has_one :weapon, through: :person_weapon

  validates :name, presence: true
  validates :first_name, presence: true
  validates :locations, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :affiliations, presence: true
end
