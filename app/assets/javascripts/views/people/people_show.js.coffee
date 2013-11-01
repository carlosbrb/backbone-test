class BackboneTest.Views.PeopleShow extends Backbone.View

  template: JST['people/show']

  events:
    'click #back_person': 'backPerson'
    'click #edit': 'editPerson'
    'submit #person_event': 'personEvent'

  render: ->
    $(@el).html(@template(person: @model))
    this

  backPerson: (event) ->
    event.preventDefault()
    window.history.back()  

  editPerson: (event) ->
    event.preventDefault()
    Backbone.history.navigate("people/#{@model.get('id')}/edit", true)

  personEvent: (event) ->
    alert 'evento'
    event.preventDefault()

