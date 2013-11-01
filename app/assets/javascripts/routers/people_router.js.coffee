class BackboneTest.Routers.People extends Backbone.Router
  routes:
    '': 'index'
    'people/new': 'new'
    'people/:id/edit': 'edit'
    'people/:id': 'show'

  initialize: ->
    @collection = new BackboneTest.Collections.People()
    @collection.fetch({reset: true})
    # @collection.fetch({reset: true})
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
    view = new BackboneTest.Views.PeopleShow(model: @model)
    $("#box").html(view.render().el)
    $('#calendar').fullCalendar()

  edit: (id) ->
    @model = @collection.get(id)
    view = new BackboneTest.Views.PeopleEdit(model: @model)
    $("#box").html(view.render().el)    