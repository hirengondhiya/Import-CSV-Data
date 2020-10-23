class PeopleController < ApplicationController
  def index
    @people = Person.all
    @import = People::Import.new
  end

  def import
    @import = People::Import.new people_import_params
    
    if @import.process!
      flash[:notice] = "Imported #{@import.imported_count} people successfully and #{@import.errors.count} failures."
      redirect_to root_path
    else
      @people = Person.all
      flash[:alert] = "Imported #{@import.imported_count} people successfully and #{@import.errors.count} failures."
      render action: :index
    end
  end

  private
  def people_import_params
    params.require(:people_import).permit(:file)
  end
end
