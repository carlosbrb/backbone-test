class BackboneTest.Views.Person extends Backbone.View

  template: JST['people/person']
  tagName: 'li'

  events: 
    'click': 'showPerson'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('highLigth', @highLigthRender, this)
  
  showPerson: ->
    Backbone.history.navigate("people/#{@model.get('id')}", true)

  render: ->
    $(@el).html(@template(person: @model))
    this

  highLigthRender: ->
    $('.person').removeClass('zero')
    @$('.person').addClass('zero')
