class ImportPerson
  def initialize row
    @row = row
  end

  def vehicle_from_row
      if @row[:vehicle]
        vehicle = Vehicle.where(name: @row[:vehicle].capitalize).first_or_create
      end            
  end

  def weapon_from_row
      if @row[:weapon]
        weapon = Weapon.where(name: @row[:weapon].capitalize).first_or_create
      end
  end

  def locations_from_row
      locations = []
      @row[:location].split(',').each do |location|
        locations << Location.where(name: location.capitalize).first_or_create
      end
      locations
  end

  def affiliations_from_row
      affiliations = []
      if @row[:affiliations]
        @row[:affiliations].split(',').each do |affiliation| 
          affiliations << Affiliation.where(name: affiliation.capitalize).first_or_create
        end
      end
      affiliations
  end

  def execute
      name_values = @row[:name].split(' ')
      first_name, last_name =  name_values.values_at(0, -1)

      person = Person.create(
        name: to_title_case(@row[:name]), 
        first_name: first_name.capitalize, 
        last_name: last_name.capitalize, 
        species: @row[:species], 
        gender: @row[:gender], 
        vehicle: vehicle_from_row, 
        weapon: weapon_from_row, 
        locations: locations_from_row, 
        affiliations: affiliations_from_row
        )
  end
end