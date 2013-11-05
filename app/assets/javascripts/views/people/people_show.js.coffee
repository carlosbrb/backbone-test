class BackboneTest.Views.PeopleShow extends Backbone.View

  template: JST['people/show']

  events:
    'click #back_person': 'backPerson'
    'click #edit': 'editPerson'
    'click #show_modal': 'showModal'
    

  render: ->
    $(@el).html(@template(person: @model))
    this

  backPerson: (event) ->
    event.preventDefault()
    window.history.back()  

  editPerson: (event) ->
    event.preventDefault()
    Backbone.history.navigate("people/#{@model.get('id')}/edit", true)

  showModal: (event) ->
    event.preventDefault()
    Backbone.history.navigate("people/#{@model.get('id')}/new_event", true)
    # console.log @el
    # $(@el).append($("#myModal").html())
    # console.log @el

  

