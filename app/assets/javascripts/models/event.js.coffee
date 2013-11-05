class BackboneTest.Models.Event extends Backbone.Model

  initialize: (options) ->
    @person_id = options.person_id
  
  url: ->
    "/api/people/#{@person_id}/events"
  

