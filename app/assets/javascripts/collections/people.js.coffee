class BackboneTest.Collections.People extends Backbone.Collection

  model: BackboneTest.Models.Person

  url: '/api/people'

  selectPerson: ->
    person = @shuffle()[0]
    person.sele() if person

      