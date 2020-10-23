require 'csv'
class ImportPeople
  def initialize(file)
    @file = file
  end

  def execute
    counter = 0
    CSV.foreach(@file.path, headers: true, header_converters: :symbol)  do |row|
      person = ImportPerson.new(row).execute
      if person 
        if person.errors.any?
          puts "#{person.name} - #{person.errors.full_messages.join(",")}"
        else
          counter += 1
        end
      end
    end
    counter
  end
end