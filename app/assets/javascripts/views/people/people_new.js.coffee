class BackboneTest.Views.PeopleNew extends Backbone.View

  template: JST['people/new']

  events:
    'submit #new_person': 'createPerson'

  initialize: ->
    @collection = new BackboneTest.Collections.People()

  render: ->
    $('#box').html($(@el).html(@template()))
    this

  createPerson: (event) ->
    event.preventDefault()
    attributes = name: $('#new_person_name').val(),address: $('#new_person_address').val(),age: $('#new_person_age').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#box').html('')
        Backbone.history.navigate('', true)
      error: ->
        alert "Faltan Datos"