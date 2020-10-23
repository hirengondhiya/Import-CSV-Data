require 'csv'
class People::Import
  include ActiveModel::Model
  attr_accessor :file, :imported_count

  def process!
    @imported_count = 0
    csv_file = CSV.open(@file.path, headers: true, header_converters: :symbol)
    csv_file.each  do |row|
      person = ImportPerson.new(row).execute
      if person.errors.any?
        errors.add :base, "Line: #{csv_file.lineno} Name: #{person.name} - #{person.errors.full_messages.join(",")}"
      else
        @imported_count += 1
      end
    end
    errors.none?
  end
end