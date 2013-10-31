class BackboneTest.Models.Person extends Backbone.Model

  sele: ->
    @set('age',0)
    @save()
    @trigger('highLigth')

