class FilmyBilly.Views.ReviewsIndex extends Backbone.View

  template: JST['reviews/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(reviews: @collection))
    this