require 'csv'
namespace :import_data do
  desc "Import Person data from CSV"
  task people: :environment do
    filename = File.join Rails.root, "SentiaCodingTestData.csv"
    CSV.foreach(filename, headers: true)  do |row|
      if row["Affiliations"]
        name_values = row["Name"].split(' ')
        first_name, last_name =  name_values.values_at(0, -1) if name_values.length > 1
          if first_name and last_name
            # p "#{first_name} #{last_name}"
            p row
            if row["Vehicle"]
              vehicle = Vehicle.where(name: row["Vehicle"].capitalize).first_or_create
            end            
            p vehicle
            if row["Weapon"]
              weapon = Weapon.where(name: row["Weapon"].capitalize).first_or_create
            end
            p weapon            
            locations = []
            row["Location"].split(',').each do |location|
              locations << Location.where(name: location.capitalize).first_or_create
            end
            p locations
            affiliations = []
            row["Affiliations"].split(',').each do |affiliation| 
              affiliations << Affiliation.where(name: affiliation.capitalize).first_or_create
            end
            p affiliations
            person = Person.create(name: row["Name"], species: row["Species"], gender: row["Gender"], vehicle: vehicle, weapon: weapon, locations: locations, affiliations: affiliations)
            p person
        end
      end
    end
  end
end
