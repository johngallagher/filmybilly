class FilmyBilly.Views.ReviewsIndex extends Backbone.View

  template: JST['reviews/showPartial']

  initialize: ->
    @collection.on('reset',@render, this)

  render: ->
    for review in @collection.models
      $(@el).append(@template(review: review))      
    
    this
