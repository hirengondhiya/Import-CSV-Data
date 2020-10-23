class RemoveWeaponFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_reference :people, :weapon, foreign_key: true
  end
end
