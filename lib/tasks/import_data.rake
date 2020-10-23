require 'csv'
namespace :import_data do
  def to_title_case str_input
    str_input.humanize.gsub(/\b('?[a-z])/) { $1.capitalize }
  end
    
  desc "Import Person data from CSV"
  counter = 0
  task people: :environment do
    filename = File.join Rails.root, "SentiaCodingTestData.csv"
    CSV.foreach(filename, headers: true, header_converters: :symbol)  do |row|
      person = ImportPerson.new(row).execute
      if person 
        if person.errors.any?
          puts "#{person.name} - #{person.errors.full_messages.join(",")}"
        else
          counter += 1
        end
      end
    end

    puts "Imported #{counter} people"
  end
end
