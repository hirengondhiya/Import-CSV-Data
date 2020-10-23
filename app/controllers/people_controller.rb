class PeopleController < ApplicationController
  def index
    @people_grid = initialize_grid(
      Person, 
      per_page: 10,
      include:  [:locations, :affiliations, :weapon, :vehicle]
      )
    @import = People::Import.new
  end

  def import
    @import = People::Import.new people_import_params
    
    if @import.process!
      flash[:notice] = "Imported #{@import.imported_count} people successfully and #{@import.errors.count} failures."
      redirect_to root_path
    else
      @people_grid = initialize_grid(
        Person, 
        per_page: 10,
        include:  [:locations, :affiliations, :weapon, :vehicle]
      )
      flash[:alert] = "Imported #{@import.imported_count} people successfully and #{@import.errors.count} failures."
      render action: :index
    end
  end

  private
  def people_import_params
    params.require(:people_import).permit(:file)
  end
end
