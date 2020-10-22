class Person < ApplicationRecord
  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :locations
  belongs_to :vehicle
  belongs_to :weapon
end
