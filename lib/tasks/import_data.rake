require 'csv'
namespace :import_data do
  def to_title_case str_input
    str_input.humanize.gsub(/\b('?[a-z])/) { $1.capitalize }
  end
    
  desc "Import Person data from CSV"
  task people: :environment do
    filename = File.join Rails.root, "SentiaCodingTestData.csv"
    CSV.foreach(filename, headers: true, header_converters: :symbol)  do |row|
      if row[:affiliations]
        name_values = row[:name].split(' ')
        first_name, last_name =  name_values.values_at(0, -1) if name_values.length > 1
          if first_name and last_name
            # p "#{first_name} #{last_name}"
            p row
            if row[:vehicle]
              vehicle = Vehicle.where(name: row[:vehicle].capitalize).first_or_create
            end            
            p vehicle
            if row[:weapon]
              weapon = Weapon.where(name: row[:weapon].capitalize).first_or_create
            end
            p weapon            
            locations = []
            row[:location].split(',').each do |location|
              locations << Location.where(name: location.capitalize).first_or_create
            end
            p locations
            affiliations = []
            row[:affiliations].split(',').each do |affiliation| 
              affiliations << Affiliation.where(name: affiliation.capitalize).first_or_create
            end
            p affiliations
            person = Person.create(name: to_title_case(row[:name]), first_name: first_name.capitalize, last_name: last_name.capitalize, species: row[:species], gender: row[:gender], vehicle: vehicle, weapon: weapon, locations: locations, affiliations: affiliations)
            p person
        end
      end
    end
  end
end
