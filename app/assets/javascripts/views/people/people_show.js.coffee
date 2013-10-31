class BackboneTest.Views.PeopleShow extends Backbone.View

  template: JST['people/show']

  events:
    'click #back_person': 'backPerson'

  render: ->
    $(@el).html(@template(person: @model))
    this

  backPerson: (event) ->
    event.preventDefault()
    window.history.back();  