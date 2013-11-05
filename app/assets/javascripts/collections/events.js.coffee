class BackboneTest.Collections.Events extends Backbone.Collection

  model: BackboneTest.Models.Event

  initialize: (models, options) ->
    @id = options.id
  
  url: ->
    "/api/people/#{@id}/events"
  


      