class CreateVehiclePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_people do |t|
      t.references :vehicle, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
