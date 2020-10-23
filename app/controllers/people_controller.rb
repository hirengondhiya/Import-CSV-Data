class PeopleController < ApplicationController
  def index
  end

  def import
    count = ImportPeople.new(params[:file]).execute()
    p "Imported #{count} users"
    redirect_to root_path, notice: "Imported #{count} users"
  end
end
