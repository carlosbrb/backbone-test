class BackboneTest.Views.PeopleIndex extends Backbone.View

  template: JST['people/index']

  events:
    'click #push_me': 'selectPerson'
    "click #new_btn": "newPerson"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendPerson)
    this

  appendPerson: (person) ->
    view = new BackboneTest.Views.Person(model: person)
    $('#people').append(view.render().el)


  newPerson: ->
    Backbone.history.navigate("people/new", true)

  handleError: (person, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors 
      for attribute, messages in errors
        alert "#{attribute} #{message}" for message in messages
          
  selectPerson: (event) ->
    event.preventDefault()
    @collection.selectPerson()