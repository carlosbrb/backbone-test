class BackboneTest.Views.PeopleEdit extends Backbone.View

  template: JST['people/edit']

  events:
    'submit #person': 'editPerson'

  # initialize: ->
  #   @model.on('change', @render, this)
  #   @collection = new BackboneTest.Collections.People()

  render: ->
    $(@el).html(@template(person: @model))
    this

  editPerson: (event) ->
    event.preventDefault()
    attributes = name: $('#new_person_name').val(),address: $('#new_person_address').val(),age: $('#new_person_age').val()
    @model.save attributes,
      wait: true
      success: ->
        $('#box').html('')
        Backbone.history.navigate('', true)
      error: ->
        alert "Faltan Datos"