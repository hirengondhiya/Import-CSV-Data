class RemoveVehicleFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_reference :people, :vehicle, foreign_key: true
  end
end
