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

  def events
    respond_with Person.find(params[:id]).events
  end

  def create_event
    person = Person.find(params[:person_id])
    event = Event.new(event_params)
    person.events << event
    respond_with event
  end
  

  private
    
    def person_params
      params.require(:person).permit(:name, :address, :age)
    end


    def event_params
      params.require(:event).permit(:title, :start, :end, :person_id)
    end
end
