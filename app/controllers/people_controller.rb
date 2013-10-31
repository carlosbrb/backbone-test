class PeopleController < ApplicationController

  respond_to :json

  def index
    respond_with Person.all    
  end

  def show
    respond_with Person.find(params[:id])
  end

  def create
    respond_with Person.create(person_params)
  end

  def update
    respond_with Person.update(params[:id],person_params)
  end

  def destroy
    respond_with Person.destroy(params[:id])
  end
  

  private

    def person_params
      params.require(:person).permit(:name, :address, :age)
    end
end
