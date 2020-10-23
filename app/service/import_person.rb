class ImportPerson
  def initialize row
    @row = row
  end

  def to_title_case str_input
    str_input.humanize.gsub(/\b('?[a-z])/) { $1.capitalize }
  end

  def vehicle_from_row
      if @row[:vehicle]
        vehicle = Vehicle.where(name: to_title_case(@row[:vehicle])).first_or_create
      end            
  end

  def weapon_from_row
      if @row[:weapon]
        weapon = Weapon.where(name: to_title_case(@row[:weapon])).first_or_create
      end
  end

  def locations_from_row
      locations = []
      @row[:location].split(',').each do |location|
        locations << Location.where(name: to_title_case(location)).first_or_create
      end
      locations
  end

  def affiliations_from_row
      affiliations = []
      if @row[:affiliations]
        @row[:affiliations].split(',').each do |affiliation| 
          affiliations << Affiliation.where(name: to_title_case(affiliation)).first_or_create
        end
      end
      affiliations
  end

  def gender_from_row
    first_char = @row[:gender][0].upcase
    if first_char == "M"
      return "Male"
    elsif first_char == "F"
      return "Female"
    end
    @row[:gender].capitalize
  end

  def execute
      name = to_title_case to_title_case(@row[:name])
      name_values = name.split(' ')
      first_name, last_name =  name_values.values_at(0, -1)

      person = Person.where(name: name).first_or_create(
         first_name: first_name, 
          last_name: name_values.length > 1 ? last_name : "", 
          species: @row[:species], 
          gender: gender_from_row, 
          vehicle: vehicle_from_row, 
          weapon: weapon_from_row, 
          locations: locations_from_row, 
          affiliations: affiliations_from_row
        )
  end
end