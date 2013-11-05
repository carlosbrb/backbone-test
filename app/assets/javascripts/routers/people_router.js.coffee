class BackboneTest.Routers.People extends Backbone.Router
  routes:
    '': 'index'
    'people/new': 'new'
    'people/:id/edit': 'edit'
    'people/:id/new_event': 'newEvent'
    'people/:id/events': 'showEvents'
    'people/:id': 'show'

  initialize: ->
    @collection = new BackboneTest.Collections.People()
    @events = null
    @collection.fetch({reset: true})
    @model = null

  index: ->
    @collection.fetch({reset: true})
    view = new BackboneTest.Views.PeopleIndex(collection: @collection)
    $("#panel").html(view.render().el)

  new: ->
    view = new BackboneTest.Views.PeopleNew()
    $("box").html(view.render().el)

  show: (id) ->
    @model = @collection.get(id)
    @events = new BackboneTest.Collections.Events([],{id: id})
    ev = []
    @events.fetch {
      success: (arr) ->
        ev = arr.map (num) -> 
          {title: num.get('title'), start: num.get('start'), end: num.get('end'), allDay: false}
        console.log ev
        $('#calendar').fullCalendar
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          }
          events:ev
          
    } 
    view = new BackboneTest.Views.PeopleShow(model: @model)
    $("#box").html(view.render().el)

  edit: (id) ->
    @model = @collection.get(id)
    view = new BackboneTest.Views.PeopleEdit(model: @model)
    $("#box").html(view.render().el) 

  newEvent: (id) ->
    @model = @collection.get(id)
    view = new BackboneTest.Views.PeopleNewEvent(model: @model)
    modal = $("<div id=\"modal\" class=\"reveal-modal small\"></div")
    modal.html(view.render().el)
    $("#box").append(modal)
    modal.foundation('reveal','open')
    $("#event_start").fdatetimepicker()




