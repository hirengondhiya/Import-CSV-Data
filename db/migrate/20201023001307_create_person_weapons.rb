class CreatePersonWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :person_weapons do |t|
      t.references :weapon, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
