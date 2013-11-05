class BackboneTest.Views.PeopleNewEvent extends Backbone.View

  template: JST['people/new_event']

  events:
    'submit #person_event': 'personEvent'
    'click #close_modal': 'closeModal'

  # initialize: ->
  #   @model.on('change', @render, this)
  #   @collection = new BackboneTest.Collections.People()

  render: ->
    $(@el).html(@template(person: @model))
    this

  personEvent: (event) ->
    event.preventDefault()
    id = @model.get('id')
    attributes = event: {start: $('#event_start').val(),title: $('#event_title').val(), person_id: $('#event_person_id').val()}
    ev = new BackboneTest.Models.Event({person_id: @model.get('id')})
    ev.save attributes,
      wait: true
      success: ->
        $("#modal").foundation('reveal','close')
        Backbone.history.navigate("people/#{id}", true)
      error: ->
        alert "Faltan Datos"
  
  closeModal: (event) ->
    window.history.back()