window.BackboneTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new BackboneTest.Routers.People()
    Backbone.history.start(pushState: true)

$(document).ready ->
  BackboneTest.initialize()
