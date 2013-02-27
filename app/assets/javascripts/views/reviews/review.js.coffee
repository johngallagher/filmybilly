class FilmyBilly.Views.Review extends Backbone.View
  template: JST['reviews/show']

  render: ->
    $('div').html(@template(review: @model))
    this