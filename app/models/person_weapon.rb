class PersonWeapon < ApplicationRecord
  belongs_to :weapon
  belongs_to :person
end
