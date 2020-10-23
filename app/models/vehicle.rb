class Vehicle < ApplicationRecord
  has_many :vehicle_people
  has_many :people, through: :vehicle_people
end
